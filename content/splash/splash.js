var serverService;

var getContents = function(aURI, charset){
  if( !charset ) {
    charset = 'UTF-8'
  }
  var ioService=Components.classes['@mozilla.org/network/io-service;1']
  .getService(Components.interfaces.nsIIOService);
  var scriptableStream=Components
  .classes['@mozilla.org/scriptableinputstream;1']
  .getService(Components.interfaces.nsIScriptableInputStream);
  // http://lxr.mozilla.org/mozilla/source/intl/uconv/idl/nsIScriptableUConv.idl
  var unicodeConverter = Components
  .classes['@mozilla.org/intl/scriptableunicodeconverter']
  .createInstance(Components.interfaces.nsIScriptableUnicodeConverter);
  unicodeConverter.charset = charset;
  
  var channel=ioService.newChannel(aURI,null,null);
  var input=channel.open();
  scriptableStream.init(input);
  var str=scriptableStream.read(input.available());
  scriptableStream.close();
  input.close();
  return unicodeConverter.ConvertToUnicode(str);
}

function runServer()
{
  serverService = Components.classes["@mozilla.org/process/util;1"]
  .getService(Components.interfaces.nsIProcess);
  
  var dirService = Components.classes['@mozilla.org/file/directory_service;1']
    .getService(Components.interfaces.nsIProperties);   

  var vmFile = dirService.get('AChrom', Components.interfaces.nsIFile);
  
  if (navigator.platform.indexOf("Win32") == 0) {
    vmFile.append("CogVM.Windows");
    vmFile.append("CogVM.exe");
  }
  
  if (navigator.platform.indexOf("MacIntel") == 0) {
    vmFile.append("CogVM.app");
    vmFile.append("Contents");
    vmFile.append("MacOS");
    vmFile.append("CogVM");
  }  
  
  if (navigator.platform.indexOf("Linux") == 0) {
    vmFile.append("CogVM.Linux");
    vmFile.append("CogVM");
  }
  
  serverService.init(vmFile);
  
  var imageFile = dirService.get('AChrom', Components.interfaces.nsIFile);
  imageFile.append("app.image");
  
  var startupScriptFile = dirService.get('AChrom', Components.interfaces.nsIFile);
  startupScriptFile.append("start.st");
  //"-headless",
  var params = ["-headless", imageFile.path, startupScriptFile.path];
  
  serverService.run(false, params, params.length);  
}

function waitOnServer()
{
  var uri = window.document.documentURI;
  var baseURI = uri.slice(0, uri.indexOf('/splash/splash.xul')) + '/';
  var port = parseInt((getContents(baseURI + 'defaultPort.txt')), 10);  
  
  if (getContents("http://localhost:"+port+"/serverRunning") != "serverRunning") {
    setTimeout(waitOnServer, 100);
  }
  else
    openMainWindow();
}


function done() {
  close();
}

function onSplashScreenWindowOpened() 
{
  var w=(screen.availWidth/2)-700/2;
  var h=(screen.availHeight/2)-299/2;
  
  window.moveTo(w,h);
  
  window.document.title = "XULJet";


  runServer();
  
  waitOnServer();
  
  // If you want to close the splash screen upon click, 
  // uncomment line below
  //$('splashImg').onclick = done;
  
  //setTimeout(done, 5000);
}

function openMainWindow()
{
  var uri = window.document.documentURI;
  var baseURI = uri.slice(0, uri.indexOf('/splash/splash.xul')) + '/';
  
  var windowWatcher = Components.classes['@mozilla.org/embedcomp/window-watcher;1'].getService(Components.interfaces.nsIWindowWatcher); 
  var newWindow = windowWatcher.openWindow(window, baseURI+"templates/main.xul", '_blank', 'chrome',null); 
  newWindow.serverService = serverService;
//  newWindow['__param_onWindowOpended'] = this.onWindowOpened;
  
  
//  var mainWindow = window.open(baseURI+"/templates/main.xul", "splash",
//                               "chrome,centerscreen", window);
  done();
  
}

window.addEventListener('load', onSplashScreenWindowOpened, false);