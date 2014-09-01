var xuljet = require('lib/xuljet');
var printing = require('lib/printing');

var phobos = {}

phobos.parseXML = function(sXML) 
{
  if(sXML.indexOf('<svg:svg') >= 0) {
    sXML = sXML.replace(/<(\/?)svg:/g, '<$1').replace('xmlns:svg', 'xmlns');
  }
  
  var out;
  try {
    var dXML = new DOMParser();
    dXML.async = false;
  } catch(e) { 
    throw new Error("XML Parser could not be instantiated"); 
  };
  try {
    if(dXML.loadXML) 
      out = (dXML.loadXML(sXML))?dXML:false;
    else 
      out = dXML.parseFromString(sXML, "text/xml");
  }
  catch(e) { throw new Error("Error parsing XML string"); };
  return out;
};

phobos.createNodesFromData = function(obj)
{
  var textNode;
  var ns = obj.namespace;
  if (ns == "XUL_NS") ns = "http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul";
    if (ns == "HTML_NS") ns = "http://www.w3.org/1999/xhtml";
      if (ns == "SVG_NS") ns = "http://www.w3.org/2000/svg";
        
        if (obj.tagName == "TEXTNODE") {
          textNode = document.createTextNode(obj.attributes[0].value);
          return [textNode]
        }
        
        if (obj.tagName == "RAWXMLNODE") {
          return [phobos.parseXML(obj.attributes[0].value).documentElement]
        }  
        
        var node = document.createElementNS(ns, obj.prefix + obj.tagName);
        for (var a = 0; a < obj.attributes.length; a++) {
          var attr = obj.attributes[a];
          node.setAttribute(attr.key, attr.value)
        }
        
        for (var p = 0; p < obj.properties.length; p++) {
          var prop = obj.properties[p];
          
          var splitted = prop.value.split('.');
          var result = window;
          splitted.forEach(function (each) {
            result = result[each]
          })  
          node[prop.key] = result;
          
        }  
        
        //node["__phobos_properties"] = obj.properties;
        
        
        if (obj.children) {
          for (var i = 0; i < obj.children.length; i++)
          {
            var children; 
            /* if (typeof obj.children[i] == 'string' || obj.children[i] == undefined)
             *        child = document.createTextNode( obj.children[i] || '');
             *      else*/
            children = phobos.createNodesFromData( obj.children[i])
            for (var n = 0; n < children.length; n++) {
              children[n].parent = node;
              node.appendChild(children[n]);
            }
            
            //child.parent = node;
            //node.appendChild(child);
          }; 
        };
        return [node];
}

phobos.createNodes = function(jsonString)
{
  var data = JSON.parse(jsonString);
  var result = [];
  for (var i = 0; i < data.length; i++) {
    var nodes = phobos.createNodesFromData(data[i]);
    for (var n = 0; n < nodes.length; n++) {
      //xuljet.dumpElement(node);
      result.push(nodes[n]);
    }
  }
  return result;
}

phobos.Message = function(aSession) 
{
  this.session = aSession;
  this.sessionId = aSession.id;
  this.type = null;
  this.target = null;
  this.content = null;
  this.argument = null;
} 

phobos.Message.prototype.stringify = function()
{
  function replacer(key,value)
  {
    if (key=="session") return undefined;
    else return value;
  }
  
  return JSON.stringify(this, replacer);
}

phobos.Message.prototype.send = function()
{
  this.session.webSocket.send(this.stringify());
}

phobos.Session = function() 
{
  this.webSocket = this.newSocket();
  this.id = xuljet.id();
} 

phobos.Session.prototype.defaultPortNumber = function()
{
  return parseInt((xuljet.getContents(xuljet.baseURI + 'defaultPort.txt')), 10);
}

phobos.Session.prototype.startUrl = function()
{
  return 'ws://localhost:'+this.defaultPortNumber()+'/newSession';
}

phobos.Session.prototype.newSocket = function()
{
  var ws;
  self = this;
  ws = new WebSocket(this.startUrl());
  ws.onopen = function(evt) { self.onOpen(evt); };
  ws.onclose = function(evt) { self.onClose(evt); };
  ws.onmessage = function(evt) { self.processMessage(JSON.parse(evt.data)) };
  ws.onerror = function(evt) { xuljet.inspect(evt) };  
  return ws;
}

phobos.Session.prototype.onOpen = function(evt)
{
  // xuljet.dumpMessage("session opened");
  
  phobos.globals.windows = {};
  phobos.globals.windows["mainWindow"] = window;
  var msg = this.newMessage()
  msg.type = "getMainWindowComponent";
  msg.argument = {
    platform: navigator.platform,
    language: navigator.language,
    baseURI: xuljet.baseURI,
  };
  msg.send(); 
}

phobos.Session.prototype.getWindow = function(id)
{
  return phobos.globals.windows[id];
}

phobos.getWindow = function(id)
{
  return phobos.globals.currentSession.getWindow(id);
}

phobos.Session.prototype.registerWindow = function(aWindow)
{
  var id = xuljet.id();
  phobos.globals.windows[id] = aWindow;
  return id;
}

phobos.Session.prototype.unregisterWindow = function(id)
{
  delete phobos.globals.windows[id];
}

phobos.Session.prototype.onClose = function(evt)
{
  //xuljet.dumpMessage("session closed")
}

phobos.Session.prototype.processMessage = function(aMessage)
{
  //  xuljet.inspect(aMessage);
  switch (aMessage.type) {
    case "replaceComponentInDocument": 
      xuljet.replaceComponentInDocument(this.getWindow(aMessage.window).document, aMessage.target, phobos.createNodes(aMessage.content)); 
      break;
    case "evaluateJS":
      this.executeJS(aMessage.content, aMessage.target);
      break;
    case "getProperty":
      this.getProperty(aMessage.window, aMessage.target, aMessage.content, aMessage.argument);
      break;
    case "setProperty":
      this.setProperty(aMessage.window, aMessage.target, aMessage.content, aMessage.argument)
      break;
    case "setAttribute":
      this.setProperty(aMessage.window, aMessage.target, aMessage.content, aMessage.argument)
      break;
    case "openWindow":
      this.openWindow(aMessage.window, aMessage.argument)
      break;
    case "processForm":
      this.processForm(aMessage.window, aMessage.argument, aMessage.target)
      break;
    case "printNodes":
      this.printNodes(aMessage.window, phobos.createNodes(aMessage.content))
      break;      
    case "setWindowTitle":
      this.getWindow(aMessage.window).document.title = aMessage.argument;
      break;
    case "setBrowserFinishCallback":
      this.setBrowserFinishCallback(aMessage.window, aMessage.argument, aMessage.target);
      break;
    case "setCodeMirrorText":
      this.setCodeMirrorText(aMessage.window, aMessage.argument, aMessage.content);
      break;
    default:
      break;
  }
}


phobos.Session.prototype.setBrowserFinishCallback = function(windowId, elementId, continuation)
{
  var self = this;
  var browser = this.getWindow(windowId).document.getElementById(elementId);
  var listener = xuljet.defaultProgressListener();
  listener.onOverallFinish = function() { 
    phobos.runClosure(continuation);
  };
  browser.addProgressListener( listener, Components.interfaces.nsIWebProgress.NOTIFY_ALL);
}

phobos.Session.prototype.setCodeMirrorText = function(windowId, elementId, text)
{
  this.getWindow(windowId).document.getElementById(elementId).contentDocument.editor.setValue(text);
}

phobos.Session.prototype.printNodes = function(windowID, nodes)
{
  var doc = this.getWindow(windowID).document;
  var rootNode = doc.getElementsByTagName('window')[0];
  
  if (printing.gPrintFrameId)
    rootNode.removeChild(doc.getElementById(printing.gPrintFrameId));
  
  var frameId = xuljet.id();
  var frame = doc.createElementNS(xuljet.XUL_NS, 'iframe');
  frame.setAttribute('type', 'content-primary');
  frame.setAttribute('id', frameId);
  frame.setAttribute('width', 1);
  frame.setAttribute('height', 1);
  frame.setAttribute('src', xuljet.baseURI+'templates/empty.html');
  var clone = frame.cloneNode(true);
  rootNode.appendChild(clone);
  
  this.replaceBodyInDocument(clone.contentWindow.document, nodes)
  
  var modifyPrintSettingsCallback = null;
  printing.utils.print(clone.contentWindow, modifyPrintSettingsCallback);
  
  printing.gPrintFrameId = frameId;
  clone.hidden = true;
  // NOTE: mozilla bug, if you delete iframe here, printing may not happen
  //    this.window.rootNode().removeChild(clone);  
}

phobos.Session.prototype.processFormNode = function(node, formNodes)
{
  var self = this;
  switch (node.tagName)
  {
    case 'textbox':
    case 'checkbox':
    case 'colorpicker':
    case 'listbox':
    case 'richlistbox':
    case 'menulist':
    case 'radiogroup':
    case 'scale':
    case 'datepicker':
      //   case 'timepicker':
      formNodes.push(node); 
      break;
    default: break;
  };
  var children = node.childNodes;
  for (var i = 0; i < children.length; i++) {
    self.processFormNode(children[i], formNodes)
  }  
}  

phobos.Session.prototype.processForm = function(windowId, formId, continuation)
{
  var win = this.getWindow(windowId);
  var startNode = win.document.getElementById('__start_'+formId);
  var endNode = win.document.getElementById('__end_'+formId);
  
  var currentNode = startNode;
  var parentNode = currentNode.parentNode;  
  
  var formNodes = new Array();
  
  while (currentNode && (currentNode != endNode))
  {
    this.processFormNode(currentNode, formNodes);
    currentNode = currentNode.nextSibling;
  }
  
  var result = []
  
  formNodes.forEach(function(node) {
    var callback = node.getAttribute('phobos:callback');
    var val;
    switch (node.tagName)
    {
      case 'checkbox': 
        val = node.checked;
        break;
      case 'colorpicker': 
        val = node.color; 
        break;
      case 'datepicker': 
        //   case 'timepicker': 
        val = node.dateValue; 
        break;
      case 'menulist': 
        if (node.getAttribute('editable'))
        {
          val = node.value;
          break;
        } // else continue as with radiogroup!
      case 'radiogroup': 
        if (node.getAttribute('phobos:formitem')) {
          if (node.selectedItem)
          {
            var index = node.selectedItem.getAttribute('phobos:value');
            val = parseInt(index, 10);
          } else
            val = node.value;
        }  
        break;
      case 'listbox': 
      case 'richlistbox': 
        if (callback) {
          
          var selectedCount = node.selectedCount;
          val = [];
          for (var a=0; a<selectedCount; a++)
          {
            var index = node.getSelectedItem(a).getAttribute('phobos:value');
            val.push(parseInt(index, 10))
          }
          
        }
        break;
      default: 
        val = node.value;
    }
    
    if (callback) {
      result.push({
        callback: callback,
        value: val
      })}
      
  })
    
    var msg = phobos.globals.currentSession.newMessage();
    msg.type = "passValues";
    msg.target = continuation;
    msg.argument = result;
    msg.send();   
}

phobos.Session.prototype.openWindow = function(parentWindowId, continuation)
{
  var windowWatcher = Components.classes['@mozilla.org/embedcomp/window-watcher;1'].getService(Components.interfaces.nsIWindowWatcher); 
  var newWindow = windowWatcher.openWindow(this.getWindow(parentWindowId), 'empty.xul', '_blank', 'chrome',null); 
  newWindow.phobos = window.phobos;
  newWindow.openingContinuation = continuation;
  newWindow['__param_onWindowOpended'] = this.onWindowOpened;
  return newWindow;  
}

phobos.Session.prototype.onWindowOpened = function(newWin) 
{
  "'this' is the new window"
  
  var winId = phobos.globals.currentSession.registerWindow(this);
  
  var msg = phobos.globals.currentSession.newMessage();
  msg.type = "returnValue";
  msg.argument = winId;
  msg.target = this.openingContinuation;
  msg.send();  
} 

phobos.Session.prototype.newMessage = function()
{
  var msg = new phobos.Message(this);
  return msg;
}

phobos.Session.prototype.onSocketError = function(evt)
{
  //  xuljet.inspect(evt) 
}

phobos.Session.prototype.executeJS = function(script, continuation)
{
  var msg = phobos.globals.currentSession.newMessage();
  var result = eval(script);
  msg.type = "returnValue";
  msg.target = continuation;
  msg.argument = result;
  msg.send();
}

phobos.Session.prototype.getProperty = function(windowId, elementId, propertyName, continuation)
{
  var splitted = propertyName.split('.');
  var result = this.getWindow(windowId).document.getElementById(elementId);
  splitted.forEach(function (each) {
    result = result[each]
  })  
  
  var msg = phobos.globals.currentSession.newMessage();
  msg.type = "returnValue";
  msg.content = JSON.stringify(result);
  msg.target = continuation;
  msg.argument = result;
  msg.send();
}

phobos.Session.prototype.setProperty = function(windowId, elementId, propertyName, aValue)
{
  var splitted = propertyName.split('.');
  var currentReceiver = this.getWindow(windowId).document.getElementById(elementId);
  var lastProperty = splitted.pop();
  splitted.forEach(function (each) {
    currentReceiver = currentReceiver[each]
  })   
  
  currentReceiver[lastProperty] = aValue;  
}

phobos.Session.prototype.setAttribute = function(windowId, elementId, attributeName, aValue)
{
  this.getWindow(windowId).document.getElementById(elementId).setAttribute(attributeName, aValue);
}

phobos.runClosure = function(id, anArgument)
{
  var msg = phobos.globals.currentSession.newMessage();
  msg.type = "runClosure";
  msg.target = id;
  msg.argument = anArgument;
  msg.send();
}

phobos.Session.prototype.replaceBodyInDocument = function(aDocument, newNodes)
{    
  newNodes.forEach(function(node) {
    var clonedNode = node.cloneNode(true);
    aDocument.body.appendChild(clonedNode);  
  });
}

phobos.integerInputOnKeyPress = function(elm, event)
{    
  
  if ((event.charCode == 0) && (event.keyCode != 13))
    return true;
  
  var shouldMove = (event.charCode == 0) && (event.keyCode == 13);
  
  var newValue = elm.value;
  
  if (!shouldMove) {
    
    if (!((event.charCode >= 48) && (event.charCode <= 58))) {
      event.preventDefault();
      event.stopPropagation();
      return false;  
    }
    
    var selStart = elm.selectionStart;
    var selEnd = elm.selectionEnd;
    var currentValue = elm.value;
    
    newValue = currentValue.slice(0, selStart) + String.fromCharCode(event.charCode) + currentValue.slice(selEnd, currentValue.length);
    
    elm.value = newValue;
    
    elm.setSelectionRange(selStart+1, selStart+1);
  } 
  
  var maxLength = parseInt(elm.getAttribute('phobos:maxlength'), 10)
  
  if ((newValue.length == maxLength) || ((newValue.length == maxLength) && shouldMove)) {
    document.commandDispatcher.advanceFocus();
  }
  
  event.preventDefault();
  
  var evt = document.createEvent('HTMLEvents');
  evt.initEvent('change', false, false ); // event type,bubbling,cancelable
  elm.dispatchEvent(evt);
  
  return false;
}


phobos.copyProperties = function(anObject, properiesNames) 
{
  var result = {};
  properiesNames.forEach(function (each) {
    result[each] = anObject[each]
  }); 
  return result
  
}


phobos.extractNsIFile = function(file) 
{
  return phobos.copyProperties(file, [
  "diskSpaceAvailable",
  "fileSize",
  "fileSizeOfLink",
  "followLinks",
  "lastModifiedTime",
  "lastModifiedTimeOfLink",
  "leafName",
  "permissions",
  "permissionsOfLink",
  "persistentDescriptor",
  "path"
  ])
}


phobos.openFileDialog = function(title, mode, filterMask, filters) {
  /* See:
   *   http://developer.mozilla.org/en/docs/XUL_Tutorial:Open_and_Save_Dialogs 
   *   
   *   https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XPCOM/Reference/Interface/nsIFilePicker
   *   
   *   mode: modeOpen, modeGetFolder, modeSave
   */
  
  var result = {};
  
  var nsIFilePicker = Components.interfaces.nsIFilePicker;
  var fp = Components.classes["@mozilla.org/filepicker;1"].createInstance(nsIFilePicker);
  
  fp.init(window, title, nsIFilePicker[mode]);
  fp.appendFilters(filterMask);
  
  for (var i=0; i<filters.length; i = i + 2){
    fp.appendFilter(filters[i], filters[i+1]);
  }; 
  
  var res = fp.show();
  if (res != nsIFilePicker.returnCancel) {
    result = phobos.extractNsIFile(fp.file);
  }
  
  result.dialogResult = res;
  
  return JSON.stringify(result);
  
}


function startSession()
{
  var session = new phobos.Session();
  
  phobos.globals.currentSession = session;
}

function onWindowClose(aWindow)
{
  window.serverService.kill();
}

function main()
{
  phobos.globals = {};
  
  // force groupbox border on Linux
  if (navigator.platform.indexOf("Linux") == 0) {    
    window.document.styleSheets[0].insertRule('groupbox {border-bottom: 1px solid white;border-right: 1px solid white;border-top: 1px solid lightgray;border-left: 1px solid lightgray;}', 1);
    window.document.styleSheets[0].insertRule('caption {background-color: -moz-dialog;}', 1);
  }
  startSession();
}
