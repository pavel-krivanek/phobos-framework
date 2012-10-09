window._loadJS = function(name)
{
  var basepath = document.documentURI.slice(0, document.documentURI.indexOf('/templates/main.xul')) + '/';
  dump(name+'\n')
  var loader = Components.classes['@mozilla.org/moz/jssubscript-loader;1']  
                .getService(Components.interfaces.mozIJSSubScriptLoader);
  loader.loadSubScript(basepath + name, window)
}

this._modules = []

this._require = function(moduleName, aModuleRoot)
{
  var basepath = document.documentURI.slice(0, document.documentURI.indexOf('/templates/main.xul')) + '/';
 
  var moduleRoot = aModuleRoot ? aModuleRoot : basepath;
    
  if (moduleName == 'closure-library')
  {
    window._loadJS("closure-library/closure/goog/base.js")

    goog.dependencies_ = {
      pathToNames: {}, // 1 to many
      nameToPath: {}, // 1 to 1
      requires: {}, // 1 to many
      // used when resolving dependencies to prevent us from
      // visiting the file twice
      visited: {},
      written: {} // used to keep track of script files we have written
    };

    goog.writeScriptTag_ = function(src) {
      goog.dependencies_.written[src] = true;
      var path = 'closure-library/closure/goog/'+src;
      window._loadJS(path)
    };

    window._loadJS('deps.js')
    
    return window;
  }
       
  var combinePaths = function(relPath, refPath) {
    var relPathParts = relPath.split('/');
    refPath = refPath || '';
    if (refPath.length && refPath.charAt(refPath.length-1) != '/') {
      refPath += '/';
    }
    var refPathParts = refPath.split('/');
    refPathParts.pop();
    var part;
    while (part = relPathParts.shift()) {
      if (part == '.') { continue; }
      else if (part == '..' 
        && refPathParts.length 
        && refPathParts[refPathParts.length-1] != '..') { refPathParts.pop(); }
      else { refPathParts.push(part); }
    }
    return refPathParts.join('/');
  };
  
  var resolveModuleId = function(relModuleId, refPath) {
    if (relModuleId.charAt(0) != '.') {
      return relModuleId;
    }
    else {
      return combinePaths(relModuleId, refPath);
    }
  };
  
  var uriExists = function(anURI)
  {
    try { 
      var ioService=Components.classes['@mozilla.org/network/io-service;1']
        .getService(Components.interfaces.nsIIOService);
      var scriptableStream=Components
        .classes['@mozilla.org/scriptableinputstream;1']
        .getService(Components.interfaces.nsIScriptableInputStream);

      var channel=ioService.newChannel(anURI,null,null);
      var input=channel.open();
      input.close();
    } catch(e) {
      if (e.name == 'NS_ERROR_FILE_NOT_FOUND')
        return false;
      throw (e);
    }
    return true 
  }  
  
  var resolveExistingModuleUri = function(uri)
  {
    var currentUri = uri;
//    if (uriExists(currentUri) && !uriExists(currentUri+'/')) return currentUri;
    currentUri = uri + '.js';
    if (uriExists(currentUri)) return currentUri;
    currentUri = uri + '.node';
    if (uriExists(currentUri)) return currentUri;
    currentUri = uri + '/index.js';
    if (uriExists(currentUri)) return currentUri;
    currentUri = uri + '/index.node';
    if (uriExists(currentUri)) return currentUri;
    
    throw 'module ' + uri + ' not found'
  }
  
  // Takes a module's ID and resolves a URI according to the module root path
  var resolveModuleUri = function(moduleId) {
    if (moduleId.charAt(0) != '.') {
      return resolveExistingModuleUri(basepath + moduleId);
    }
    else {
      return resolveExistingModuleUri(resolveModuleId(moduleId, moduleRoot));
    }
  };  
  
  var getModuleRoot = function(path) {
    var href = path.substr(0, path.lastIndexOf('/')+1);

    if (href.length && href.charAt(href.length-1) != '/') {
      href += '/';
    }

    return href;
  };  
  
  var detect = function(collection, iterator)
  {
    var len = collection.length;
    for (var i = 0; i < len; i++)
    {
      if (iterator(collection[i]))
        return collection[i];
    }
    return undefined;
  }  
  
  var moduleUri = resolveModuleUri(moduleName)
  
  var existingModule = detect(this._modules, function(each) {return each.uri == moduleUri});
  if (existingModule)
    return existingModule.exports;
  
  var target = {
    exports: {}, 
  };
  target.require = function(mr) {return _require(mr, getModuleRoot(moduleUri))};
  
  this._modules.push({
    uri: moduleUri,
    exports: target.exports,
  });
  
  var loader = Components.classes['@mozilla.org/moz/jssubscript-loader;1']  
                .getService(Components.interfaces.mozIJSSubScriptLoader);
  loader.loadSubScript(moduleUri, target)

  dump(moduleUri+'\n')
    
  return target.exports;
}

this.exports = {};


this._modules.push({
  uri: document.documentURI.slice(0, document.documentURI.indexOf('/templates/main.xul')) + '/main.js',
  exports: this.exports,
});

this.require = function(mr) {
  return _require(mr, document.documentURI.slice(0, document.documentURI.indexOf('/templates/main.xul')) + '/')}