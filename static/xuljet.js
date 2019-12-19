

window.xuljet = {};

exports = window.xuljet;

// constants with URIs of XML namespaces

exports.XUL_NS = 'http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul';
exports.HTML_NS = 'http://www.w3.org/1999/xhtml';
exports.SVG_NS = 'http://www.w3.org/2000/svg';
exports.XLINK_NS = 'http://www.w3.org/1999/xlink';
exports.XML_NS = 'http://www.w3.org/XML/1998/namespace';
exports.XMLNS_NS = 'http://www.w3.org/2000/xmlns/';
exports.MATH_NS = 'http://www.w3.org/1998/Math/MathML';

// define namespace for internal XULjet objects

/**
 * Get default chrome/content URI including slash
 *  
 * XULJet internal method
 * 
 * @return {string} Default chrome/content URI 
*/

var getBaseURI = function()
{
  var uri = document.documentURI;
  return uri.slice(0, uri.indexOf('/templates/main.xul')) + '/';
}

// Default URIs

exports.baseURI = getBaseURI();
exports.imagesURI = exports.baseURI+'images/';
exports.localesURI = exports.baseURI+'locales/';

// Javascript Console dump functions

/**
 * Writes a string to the JavaScript Console
 * 
 * @param {String} aString A message
*/

exports.dumpMessage = function(aString)
{
  var cls = Components.classes['@mozilla.org/consoleservice;1']; 
  var service = cls.getService(Components.interfaces.nsIConsoleService); 
  service.logStringMessage(aString);
}

/**
 * Writes the code of an element to the JavaScript Console
 * 
 * @param {Element} element An element
*/

exports.dumpElement = function(element)
{
  var serializer = new XMLSerializer();
  var xml = serializer.serializeToString(element);
  exports.dumpMessage(xml);
}

/**
 * Returns a translated string specified by an identifier.
 * 
 * It uses a default property file content/locales/strings.{locale}.txt, 
 * for example content/locales/strings.strings.en-US.txt.txt
 * 
 * A property file is a list of property key-value pairs each 
 * on a separate line. The key and value is separated with an equals sign. 
 * For example, the following defines two properties:
 * 
 * message.displayError = An error occured trying to display this message
 * nameAlreadyUsed = The name %S is already being used by another account.
 * 
 * This method accepts variable number of parameters. Each occurrence 
 * of %S (uppercase) is replaced by each successive argument. 
 * Alternatively, numbered wildcards of the format %n$S (e.g. %1$S, %2$S, etc.) 
 * can be used to specify the position of corresponding parameter explicitly
 * 
 * A global auxiliary function
 * 
 * @param {String} aStringName a string identifier
 * @param {...*} var_args Additional arguments for string formating
*/

exports.str = function(aStringName, var_args)
{
  if (!aStringName) return '';
  if (!exports.locale.stringbundle)
    return aStringName;
  try {
    if (arguments.length == 1)
      return exports.locale.stringbundle.getString(aStringName)

    var args = Array.prototype.slice.call(arguments);
    args.shift();
    
    return exports.locale.stringbundle.getFormattedString(aStringName, args);
  } catch (e) {
    return aStringName
  }
}

exports.lstr = function(aStringName)
{
  return exports.str.apply(this, arguments) + ':';
}


function bindJs_(fn, selfObj, var_args) {
  var context = selfObj || window;

  if (arguments.length > 2) {
    var boundArgs = Array.prototype.slice.call(arguments, 2);
    return function() {
      // Prepend the bound arguments to the current arguments.
      var newArgs = Array.prototype.slice.call(arguments);
      Array.prototype.unshift.apply(newArgs, boundArgs);
      return fn.apply(context, newArgs);
    };

  } else {
    return function() {
      return fn.apply(context, arguments);
    };
  }
};

function bindNative_(fn, selfObj, var_args) {
  return /** @type {!Function} */ (fn.call.apply(fn.bind, arguments));
};  

exports.bind = function(fn, selfObj, var_args) {
  if (Function.prototype.bind &&
      Function.prototype.bind.toString().indexOf('native code') != -1) {
    exports.bind = bindNative_;
  } else {
    exports.bind = bindJs_;
  }
  return exports.bind.apply(null, arguments);
}; 

exports.inherits = function(childCtor, parentCtor) {
  /** @constructor */
  function tempCtor() {};
  tempCtor.prototype = parentCtor.prototype;
  childCtor.superClass_ = parentCtor.prototype;
  childCtor.prototype = new tempCtor();
  childCtor.prototype.constructor = childCtor;
};

exports.clone = function(obj) {
  var res = {};
  for (var key in obj) {
    res[key] = obj[key];
  }
  return res;
};

exports.extend = function(target, var_args) {
  var key, source;
  
  var PROTOTYPE_FIELDS_ = [
    'constructor',
    'hasOwnProperty',
    'isPrototypeOf',
    'propertyIsEnumerable',
    'toLocaleString',
    'toString',
    'valueOf'
  ];  
  
  for (var i = 1; i < arguments.length; i++) {
    source = arguments[i];
    for (key in source) {
      target[key] = source[key];
    }

    for (var j = 0; j < PROTOTYPE_FIELDS_.length; j++) {
      key = PROTOTYPE_FIELDS_[j];
      if (Object.prototype.hasOwnProperty.call(source, key)) {
        target[key] = source[key];
      }
    }
  }
};

// Closure registry

/**
 * ClosureRegistry is a map where keys are unique strings and values are
 * closures or references to functions. 
 * @constructor
*/

window._XULJetClosureRegistry = function() { };
window._XULJetClosureRegistry.lastUID = 0; 
window._XULJetClosureRegistry.registry = {};

/**
 * Adds a closure to the closure registry
 * @param {Function} aClosure 
 * @return {String} an assigned identificator
*/

window._XULJetClosureRegistry.add = function(aClosure) 
{
  window._XULJetClosureRegistry.lastUID++;
  var uid = 'closure' + window._XULJetClosureRegistry.lastUID.toString();
  window._XULJetClosureRegistry.registry[uid] = aClosure;
  return uid;
}

/**
 * Generates an unique identificator for general purposes
 * @return {String} an unique string indentificator
*/

exports.id = function() {
  exports.id.lastUID++;
  return 'XULID_' + exports.id.lastUID.toString();
}
exports.id.lastUID = 0;


exports.firstDayOfWeek = function()
{
  var sundayLocales = ['en-US', 'en-GB'];
  if (sundayLocales.indexOf(exports.locale.name) != -1)
  {
    return 0;
  }
  return 1;
}

// AbstractCanvas

exports.AbstractCanvas = function(parentCanvas, aComponent) 
{
  this.nodes = parentCanvas ? parentCanvas.nodes : new Array();
  this.component = aComponent;
  this.automaticProperties = false;
} 

exports.AbstractCanvas.prototype.roots = function()
{
  return this.nodes.filter(function(each) {
    return each.parentNode == undefined
  });
}
  
exports.AbstractCanvas.prototype.XUL = function()
{
  return new exports.XULCanvas(this, this.component)
}
  
exports.AbstractCanvas.prototype.HTML = function()
{
  return new exports.HTMLCanvas(this, this.component)
}

exports.AbstractCanvas.prototype.SVG = function()
{
  return new exports.SVGCanvas(this, this.component)
}

exports.AbstractCanvas.prototype.insertNodes = function(nodes)
{
  nodes.isElementsCollection = true;
  nodes.forEach(function(each) {this.nodes.push(each)}, this)
  return nodes;
}

exports.AbstractCanvas.prototype.insert = function(aClosure, arg)
{
  var embeddedCanvas = new this.constructor(null, this.component)
  var boundClosure = exports.bind(aClosure, this.component)
  boundClosure(embeddedCanvas, arg);
  var roots = embeddedCanvas.roots();
  
  roots.isElementsCollection = true;
  roots.forEach(function(each) {this.nodes.push(each)}, this)
  return roots;
} 

exports.AbstractCanvas.prototype.insertSVGFile = function(anURI)
{
  return this.insertNodes([parseXML(exports.getContents(anURI)).documentElement])
}

exports.AbstractCanvas.prototype.collect = function(aCollection, aClosure)
{
  var boundClosure = exports.bind(aClosure, this.component)
  return this.insert(function(_xul) {
  aCollection.forEach(function(item, index) {
    boundClosure(_xul, item, index)})})
}

// XULCanvas

exports.XULCanvas = function(parentCanvas, aComponent)
{
  exports.AbstractCanvas.call(this, parentCanvas, aComponent);
}
exports.inherits(exports.XULCanvas, exports.AbstractCanvas);


exports.XULCanvas.prototype.sectionStart = function(id)
{
  var oldSetting = this.automaticProperties;
  this.automaticProperties = false;
  var result = this.description({hidden: true, id: '__start_'+id });
  this.automaticProperties = oldSetting;
  return result;
}
  
exports.XULCanvas.prototype.sectionEnd = function(id)
{
  var oldSetting = this.automaticProperties;
  this.automaticProperties = false;
  var result = this.description({hidden: true, id: '__end_'+id });
  this.automaticProperties = oldSetting;
  return result;
}
  
exports.XULCanvas.prototype.formStart = function(id)
{
  return this.sectionStart(id)
}
  
exports.XULCanvas.prototype.formEnd = function(id)
{
  return this.sectionEnd(id)
}
  
exports.XULCanvas.prototype.formlistbox = function(attributes, collection, object, property)
{
  return (this.listbox(attributes, 
    this.collect(collection, function(_xul, item, index) {
      _xul.listitem({label: item, 'xuljet:value': index, selected: (object[property].indexOf(item)>=0)})})
    )).attach(collection).on(object, property)
}

exports.XULCanvas.prototype.formmenulist = function(attributes, collection, object, property)
{
  return (this.menulist(attributes, this.menupopup(( 
    this.collect(collection, function(_xul, item, index) {
      _xul.menuitem({label: item, 'xuljet:value': index, selected: (item == object[property])})})
    ))).attach(collection).on(object, property))
}

exports.XULCanvas.prototype.formradiogroup = function(attributes, collection, object, property)
{
  return (this.radiogroup(attributes, 
  this.collect(collection, function(_xul, item, index) {
    _xul.radio({label: item, 'xuljet:value': index, selected: (object[property].indexOf(item)>=0)})})
  )).attach(collection).on(object, property)
}

exports.getProperty = function(receiver, propertyNameOrClosure)
{
  if (!propertyNameOrClosure) return object;
  
  if (typeof propertyNameOrClosure == 'function')
  {
    return propertyNameOrClosure(receiver)
  }
  
  var splitted = propertyNameOrClosure.split('.');
  var obj = receiver;
  splitted.forEach(function (each) {
    obj = obj[each]
  })
  return obj;
}

exports.inspect = function(obj)
{
  exports.dumpMessage("-----------");
  for (var prop in obj) exports.dumpMessage(prop + ": " + obj[prop]); 
  exports.dumpMessage("-----------");
}

exports.selectedListItem = function(listboxElement)
{
  var collection = listboxElement.attachedObjects['attachedObject'];
  var index = listboxElement.selectedItem.getAttribute('xuljet:value');
  return collection[parseInt(index, 10)];
}

exports.XULCanvas.prototype.list = function(listboxAttributes, aCollection, columns, onSelect, contextMenuId)
{
  var attribs = exports.clone(listboxAttributes);
  attribs.onselect = this.component.$C(function(listboxElement) {
    if (onSelect && listboxElement.selectedItem)
    {
      var val = exports.selectedListItem(listboxElement)
      onSelect.call(this.component, val)
    }
  })
  
  return (this.listbox(attribs,
    this.listcols(
      this.collect(columns, function(_xul, column, index) {
        _xul.listcol({flex: 1});
        if (index != columns.length-1)
          _xul.splitter({class: 'tree-splitter'})})), 
                   
    this.listhead(
      this.collect(columns, function(_xul, column) {
        _xul.listheader({label: column.label});
      })), 
      
    this.collect(aCollection, function(_xul, item, index) {
      attribs = {'xuljet:value': index};
      if (contextMenuId)
        attribs.context = contextMenuId;
      _xul.listitem(attribs, 
        _xul.collect(columns, function(__xul, column, columnIndex) {
          __xul.label({value: exports.getProperty(item, column.property)})
          }))
  }))).attach(aCollection)   
}

exports.XULCanvas.prototype.tags = ['action', 'assign', 'bbox', 'binding', 'bindings', 'box', 'broadcasterset', 
  'broadcaster', 'browser', 'caption', 'colorpicker', 'column', 'columns', 'commandset', 'command', 
  'condition', 'content', 'arrowscrollbox', 'button', 'checkbox', 'colorpicekr', 
  'datepicker', 'description', 'listbox', 'listitem', 'menuitem', 'menulist', 
  'menuseparator', 'menu', 'radiogroup', 'radio', 'richlistbox', 'richlistitem', 
  'scale', 'tab', 'tabs', 'textbox', 'timepicker', 'toolbarbutton', 'tree', 'deck', 
  'dialogheader', 'dialog', 'dropmarker', 'editor', 'grid', 'grippy', 'groupbox', 'hbox', 
  'iframe', 'image', 'keyset', 'key', 'label', 'listcell', 'listcol', 'listcols', 
  'listhead', 'listheader', 'member', 'menubar', 'menupopup', 'notificationbox', 
  'notification', 'observers', 'operation', 'overlay', 'page', 'panel', 'param', 'popup',
  'popupset', 'prefpane', 'preferences', 'progressmeter', 'queryset', 'query',
  'resizer', 'row', 'rows', 'rule', 'script', 'scrollbar', 'scrollbox', 
  'scrollcorner', 'separator', 'spacer', 'spinbuttons', 'splitter', 'stack', 
  'statusbarpanel', 'statusbar', 'stringbundleset', 'stringbundle', 'tabbox',
  'tabbrowser', 'tabpanel', 'tabpanels', 'template', 'textnode', 'titlebar', 
  'toolbargrippy', 'toolbaritem', 'toolbarpalette', 'toolbarseparator', 
  'toolbarset', 'toolbarspacer', 'toolbarspring', 'toolbar', 'toolbox', 'tooltip',
  'treecell', 'treechildren', 'treecol', 'treecols', 'treeitem', 'treerow', 
  'treeseparator', 'triple', 'vbox', 'where', 'window', 'wizardpage', 'wizard'];

// HTMLCanvas

exports.HTMLCanvas = function(parentCanvas, aComponent)
{
  exports.AbstractCanvas.call(this, parentCanvas, aComponent);
  this.nodes = parentCanvas ? parentCanvas.nodes : [];
}
exports.inherits(exports.HTMLCanvas, exports.AbstractCanvas);

exports.HTMLCanvas.prototype.tags = ['a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article', 'aside', 'audio', 
    'b', 'base', 'basefont', 'bdo', 'big', 'blockquote', 'body', 'br', 'button', 
    'canvas', 'caption', 'center', 'cite', 'code', 'col', 'colgroup', 'command', 
    'datalist', 'dd', 'del', 'details', 'dfn', 'dir', 'div', 'dl', 'dt', 
    'em', 'embed', 'fieldset', 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset', 
    'h1', 'head', 'header', 'hgroup', 'hr', 'html', 
    'i', 'iframe', 'img', 'input', 'ins', 
    'keygen', 'kbd', 
    'label', 'legend', 'li', 'link',
    'map', 'mark', 'menu', 'meta', 'meter', 
    'nav', 'noframes', 'noscript', 
    'object', 'ol', 'optgroup', 'option', 'output', 
    'p', 'param', 'pre', 'progress', 
    'q', 
    'rp', 'rt', 'ruby', 
    's', 'samp', 'script', 'section', 'select', 'small', 'source', 'span', 
    'strike', 'strong', 'style', 'sub', 'summary', 'sup', 
    'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'tt', 
    'u', 'ul', 
    'var', 'video', 
    'wbr', 
    'xmp' ];


// SVGCanvas

exports.SVGCanvas = function(parentCanvas, aComponent)
{
  exports.AbstractCanvas.call(this, parentCanvas, aComponent);
  this.nodes = parentCanvas ? parentCanvas.nodes : [];
}
exports.inherits(exports.SVGCanvas, exports.AbstractCanvas);

exports.SVGCanvas.prototype.tags = [
  'a', 'altGlyph', 'altGlyphDef', 'altGlyphItem', 'animate', 'animateColor', 
  'animateMotion', 'animateTransform', 'circle', 'clipPath', 'color-profile', 
  'cursor', 'definition-src', 'defs', 'desc', 'ellipse', 'feBlend', 'feColorMatrix', 
  'feComponentTransfer', 'feComposite', 'feConvolveMatrix', 'feDiffuseLighting', 
  'feDisplacementMap', 'feDistantLight', 'feFlood', 'feFuncA', 'feFuncB', 'feFuncG', 
  'feFuncR', 'feGaussianBlur', 'feImage', 'feMerge', 'feMergeNode', 'feMorphology', 
  'feOffset', 'fePointLight', 'feSpecularLighting', 'feSpotLight', 'feTile', 
  'feTurbulence', 'filter', 'font', 'font-face', 'font-face-format', 'font-face-name', 
  'font-face-src', 'font-face-uri', 'foreignObject', 'g', 'glyph', 'glyphRef', 'hkern', 
  'image', 'line', 'linearGradient', 'marker', 'mask', 'metadata', 'missing-glyph', 
  'mpath', 'path', 'pattern', 'polygon', 'polyline', 'radialGradient', 'rect', 'script', 
  'set', 'stop', 'style', 'svg', 'switch', 'symbol', 'text', 'textPath', 'title', 'tref', 
  'tspan', 'use', 'view' ];

// Generate renderer classes

exports.isAttributes = function(attrs)
{
  return (typeof attrs == 'object') 
  && !(attrs instanceof XULElement) 
  && !(attrs instanceof HTMLElement) 
  && !(attrs instanceof SVGElement) 
  && !(attrs instanceof Text) 
  && !(attrs instanceof Array) 
  && !(attrs.isElementsCollection);
}

exports.isElement = function(anObject)
{
  return anObject instanceof Element 
    || anObject instanceof Text 
    || anObject instanceof XULElement 
    || anObject instanceof HTMLElement 
    || anObject instanceof SVGElement 
}

exports.processAttribute = function(aNode, key, value, aCanvas)
{
  if (key == 'returncommand')
  {
    key = 'onkeypress';
    var oldValue = value;
    value = function(element, event) {
      if (event.keyCode == KeyEvent.DOM_VK_RETURN) 
        this.$(oldValue).doCommand()
    }     
  }

  if (key == 'link')
  {
    var splitted = value[1].split('.');
    var currentValue = value[0];
    splitted.forEach(function (each) {
      currentValue = currentValue[each]
    })   
  
    var safeCurrentValue = (currentValue == undefined || currentValue == null) ? '' : currentValue;
      
    aNode.setAttribute('xuljet:linkedWithForm', true);
    aNode.setAttribute('xuljet:name', value[1]);
    switch (aNode.tagName)
    {
      case 'textbox': 
        aNode.setAttribute('value', safeCurrentValue); 
        break;
      case 'checkbox': 
        aNode.setAttribute('checked', currentValue); 
        break;
      case 'colorpicker': 
        aNode.setAttribute('color', currentValue); 
        break;
      case 'datepicker': 
 //     case 'timepicker': 
        aNode.setAttribute('dateValue', currentValue); 
        break;
     default:  
        aNode.setAttribute('value', currentValue)
    }
    aNode.setFormReceiver(value);
    return;
  }
  
  var val = value;
  
  if ((key == 'bind') || (key == 'id' && aCanvas.automaticProperties))
  {
    aNode.bindProperty(aCanvas.component, value)
    aCanvas.component[value] = aNode;
  }
  
  if (typeof val == 'function')
    val = aCanvas.component.$C(val);
  
  aNode.setAttribute(key, val)
}

exports.makeTagHelper = function(namespace, prefix, tagName)
{
  return function(attrs)
  {
  var node = document.createElementNS(namespace, prefix + tagName);
  var firstArgIsAttributes = exports.isAttributes(attrs);
  
  if (firstArgIsAttributes)
    for (var key in attrs)
      exports.processAttribute(node, key, attrs[key], this);

  var startIndex = firstArgIsAttributes ? 1 : 0;
  
  for (var i = startIndex; i < arguments.length; i++)
  {
    var arg = arguments[i];
    if (typeof arg == 'string' || arg == undefined)
      arg = document.createTextNode(arg || '');
    if (exports.isElement(arg))
    {
      arg.parent = node;
    }

    if (arg.isElementsCollection)
    for (var j = 0; j < arg.length; j++)
    {
      if (arg[j])
        node.appendChild(arg[j]);
    }
    else
      node.appendChild(arg);
  };
  
  this.nodes.push(node);
  return node;
  };
}

exports.XULCanvas.prototype.section = function(attrs)
{
  var firstArgIsAttributes = exports.isAttributes(attrs);
  
  var children = []
  
  var id;
  if (firstArgIsAttributes)
  for (var key in attrs)
  {
    if (key == 'id')
    id = attrs[key]
  }
  if (!id) id = exports.id();
  
  var oldSetting = this.automaticProperties;
  this.automaticProperties = false;
  var result = this.description({hidden: true, id: '__start_'+id });
  this.automaticProperties = oldSetting;
  children.push(result)
  
  var startIndex = firstArgIsAttributes ? 1 : 0;

  for (var i = startIndex; i < arguments.length; i++)
  {
    var arg = arguments[i];
    if (typeof arg == 'string' || arg == undefined)
      arg = document.createTextNode(arg || '');
    if (exports.isElement(arg) )
    {
      children.push(arg)
    }

    if (arg.isElementsCollection)
      for (var j = 0; j < arg.length; j++)
        children.push(arg[j])
    else
      children.push(arg);
  };

  oldSetting = this.automaticProperties;
  this.automaticProperties = false;
  result = this.description({hidden: true, id: '__end_'+id });
  this.automaticProperties = oldSetting;
  children.push(result);

  children.isElementsCollection = true;
  return children;
};

exports.XULCanvas.prototype.form = exports.XULCanvas.prototype.section;

exports.makeTagHelpers = function(canvasClass, namespace, prefix)
{
  var tags = canvasClass.prototype.tags;
  for (var i = tags.length - 1; i >= 0; i--)
  {
    var tagName = tags[i];
    canvasClass.prototype[tagName] = exports.makeTagHelper(namespace, prefix, tagName)
  };
}
  
exports.extend(Element.prototype, {
  on: function(obj, property)
  {
    var currentValue;
    
    var splitted = property.split('.');
    var currentValue = obj;
    splitted.forEach(function (each) {
      currentValue = currentValue[each]
    })      
        
    this.setAttribute('xuljet:name', property);
    switch (this.tagName)
    {
      case 'checkbox': 
        this.setAttribute('checked', currentValue); 
        break;
      case 'colorpicker': 
        this.setAttribute('color', currentValue); 
        break;
      case 'datepicker': 
  //    case 'timepicker': 
    //    this.setAttribute('dateValue', currentValue); 
        break;
      default:  
        this.setAttribute('value', currentValue)
    }
    this.setFormReceiver([obj, property]);
    
    return this;
  },
  
  attach: function(obj, propertyName)
  {
    var property = propertyName ? propertyName : 'attachedObject';
    return attachObject(this, property, obj)
  },

  bindProperty: function(obj, propertyName)
  {
    return attachObject(this, 'propertyBinding', {object: obj, property: propertyName})
  },  
  
  setFormReceiver: function(obj)
  {
    return attachObject(this, 'formReceiver', obj)
  }
})

// Component

exports.Component = function(aWindow)
{  
  this.id = exports.id();
  this.registeredClosures = [];
  this.window = aWindow;
  this.localesPackageName = undefined;
}
 
exports.Component.prototype.children = function()
{
  return [];
} 
 
exports.Component.prototype.canBeReplaced = function()
{
  return true;
} 
 
exports.Component.prototype.clearClosures = function()
{
  this.registeredClosures.forEach(function(each) {
  delete window._XULJetClosureRegistry.registry.each});
  this.registeredClosures = [];
}

exports.Component.prototype.setWindow = function(aWindow)
{
  this.window = aWindow;
  this.children().forEach(function (each) {
    each.setWindow(aWindow)});
},

exports.Component.prototype.ID = function(aString)
{
  if (!this._ids) this._ids = {};
  
  var result = this._ids[aString];
  if (result != undefined) return result;
  
  result = exports.id();
  this._ids[aString] = result;
  return result;
}

exports.Component.prototype.$C = function(aClosure)
{
  var boundClosure = exports.bind(aClosure, this);
  var closureId = window._XULJetClosureRegistry.add(boundClosure);
  this.registeredClosures.push(closureId);
  return 'if(typeof event == \'undefined\') (window._XULJetClosureRegistry.registry["'+closureId+'"])(this, undefined); else (window._XULJetClosureRegistry.registry["'+closureId+'"])(this, event)';
}
  
exports.Component.prototype.$ = function(element) 
{
  if (arguments.length > 1) {
    for (var i = 0, elements = [], length = arguments.length; i < length; i++)
      elements.push(this.$(arguments[i]));
    return elements;
  }
  if (typeof element == 'string')
    element = this.window.document.getElementById(element);
  return element;
}

exports.Component.prototype.str = function(aStringName)
{
  if (!aStringName) return '';
  if (!exports.locale.stringbundle || !this.localesPackageName)
    return aStringName;

  var stringBundle = getStringBundle(exports.locale.name, exports.locale.fallbacklocale, this.localesPackageName)

  if (!stringBundle)
    return aStringName;

  if (!stringBundle.getAttribute('src'))
    return aStringName;
  
  try {
    if (arguments.length == 1)
      return stringBundle.getString(aStringName)

    var args = Array.prototype.slice.call(arguments);
    args.shift();
    
    return stringBundle.getFormattedString(aStringName, args);
  } catch (e) {
    return aStringName
  }
}

exports.Component.prototype.lstr = function(aStringName)
{
  return this.str.apply(this, arguments) + ':';
}

exports.Component.prototype.render = function(xul)
{
}

exports.Component.prototype.finishRendering = function()
{
}

exports.Component.prototype.finishRenderingWithChildren = function()
{
  this.finishRendering();
  this.children().forEach(function (each) {
    each.finishRenderingWithChildren()});
}

exports.Component.prototype.rendered = function()
{
  this.clearClosures();
  var xul = new exports.XULCanvas(null, this); 
  xul.sectionStart(this.id);
  this.render(xul);
  xul.sectionEnd(this.id);
  var roots = xul.roots();
  roots.isElementsCollection = true;
  return roots;
}  
  
exports.Component.prototype.refresh = function()
{
  var roots = this.rendered();
  replaceComponentInDocument(this.window.document, this.id, roots)
  this.finishRenderingWithChildren();
}
  
exports.Component.prototype.replace = function(oldComponent)
{
  if (oldComponent.canBeReplaced()) {
    var roots = this.rendered();
    oldComponent.clearClosures();
    replaceComponentInDocument(this.window.document, oldComponent.id, roots)
    this.finishRenderingWithChildren();
  }
}
  
exports.Component.prototype.remove = function()
{
  if (this.canBeReplaced()) {
    this.clearClosures();
    replaceComponentInDocument(this.window.document, this.id, []);
  }
}
  
exports.Component.prototype.refreshSection = function(id, aClosure )
{
  var boundClosure = exports.bind(aClosure, this)
  var xul = new exports.XULCanvas(null, this); 
  xul.sectionStart(id);
  boundClosure(xul);
  xul.sectionEnd(id);
  var roots = xul.roots();
  roots.isElementsCollection = true;
  replaceComponentInDocument(this.window.document, id, roots)
}
  
exports.Component.prototype.beMainWindowComponent = function()
{
  this.id = 'mainWindowComponent';
  this.refresh();
}
  
exports.Component.prototype.formValue = function(formId)
{
  return processFormInDocument(this.window.document, formId, false); 
}

exports.Component.prototype.processForm = function(formId)
{
  return processFormInDocument(this.window.document, formId, true); 
}  

exports.Component.prototype.reloadForm = function(formId)
{
  return reloadFormInDocument(this.window.document, formId); 
}  
  
exports.Component.prototype.appendForm = function(formId, target)
{
  var obj = target? target : this;
  exports.extend(obj, this.formValue(formId))
}
  
exports.Component.prototype.print = function(aCanvas, modifyPrintSettingsCallback)
{
  if (printing.gPrintFrameId)
    exports.Window.main.rootNode().removeChild(exports.Window.main.document.getElementById(printing.gPrintFrameId));

  var frameId = exports.id();
  var frame = document.createElementNS(exports.XUL_NS, 'iframe');
  frame.setAttribute('type', 'content-primary');
  frame.setAttribute('id', frameId);
  frame.setAttribute('width', 1);
  frame.setAttribute('height', 1);
  frame.setAttribute('src', exports.baseURI+'templates/empty.html');
  var clone = frame.cloneNode(true);
  exports.Window.main.rootNode().appendChild(clone);
  
  replaceBodyInDocument(clone.contentWindow.document, aCanvas.roots())
  
  printing.utils.print(clone.contentWindow, modifyPrintSettingsCallback);
  
  printing.gPrintFrameId = frameId;
  clone.hidden = true;
  // NOTE: mozilla bug, if you delete iframe here, printing may not happen
  //    this.window.rootNode().removeChild(clone);  
}
  
exports.Component.prototype.alert = function(message)
{
  this.window.alert(message);
}
  
exports.Component.prototype.prompt = function(text, value)
{
  return this.window.prompt(text, value);
}

exports.Component.prototype.confirm = function(text)
{
  return this.window.confirm(text);
}

exports.defaultProgressListener = function()
{
  // from http://mdn.beonex.com/en/XUL_Questions_and_Answers#What_is_an_example_of_addProgressListener.3f
  // use:
  //   var listObj = xuljet.defaultProgressListener();
  //   listObj.onFinish = function() {alert("finish")}
  //     browserObj.addProgressListener( listObj, Components.interfaces.nsIWebProgress.NOTIFY_STATE_WINDOW );

  var listObj = new Object();
  
  // custom callbacks
  listObj.pregressChanged = function(aCurTotalProgress, aMaxTotalProgress) { }  
  listObj.onStart = function() { }  
  listObj.onFinish = function() { }  
  listObj.onOverallFinish = function() { }  
  
  listObj.wpl = Components.interfaces.nsIWebProgressListener;
  listObj.QueryInterface = function(aIID) {
    if (aIID.equals(Components.interfaces.nsIWebProgressListener) ||
      aIID.equals(Components.interfaces.nsISupportsWeakReference) ||
      aIID.equals(Components.interfaces.nsIXULBrowserWindow) ||
      aIID.equals(Components.interfaces.nsISupports))
      return this;
    throw Components.results.NS_NOINTERFACE;
  }

  listObj.onStateChange = function(aProgress, aRequest, aFlag, aStatus) {
    if (aFlag & listObj.wpl.STATE_REDIRECTING) {
      listObj.onStart()
    }  
    if (aFlag & listObj.wpl.STATE_START) {
      listObj.onStart()
    } else {
      if (aFlag & listObj.wpl.STATE_STOP) {
        if ( aFlag & listObj.wpl.STATE_IS_WINDOW ) {
          // This fires when ALL load finish
          listObj.onFinish()
        }
        if ( aFlag & listObj.wpl.STATE_IS_NETWORK ) {
          // Fires when ALL load are REALLY over,
          // do something "final" here
          listObj.onOverallFinish()
        } else {
        // This fires when a load finishes
        }
      }
    }
    return 0;
  }
  // This fires when the location bar changes i.e load event is confirmed
  // or when the user switches tabs
  listObj.onLocationChange = function(aProgress, aRequest, aURI) {
  // do whatever you want to do
    return 0;
  }
  // For definitions of the remaining functions see XulPlanet.com
  listObj.onProgressChange = function(aWebProgress, aRequest, aCurSelfProgress, aMaxSelfProgress, aCurTotalProgress, aMaxTotalProgress) { 
    listObj.pregressChanged(aCurTotalProgress, aMaxTotalProgress)     
  };
//  listObj.onProgressChange = function() { return 0 };
 
  listObj.onStatusChange = function() { return 0 };
  listObj.onSecurityChange = function() { return 0 };
  listObj.onLinkIconAvailable = function() { return 0 };
  
  return listObj;
}


var attachObject = function(tag, propertyName, object)
{
  if (!tag.getAttribute('xuljet:attachedObjects'))
    tag.setAttribute('xuljet:attachedObjects', exports.id());
  if (!tag.attachedObjects) tag.attachedObjects = {};
  tag.attachedObjects[propertyName] = object;
  return tag;
}

var collectAttachedObjects = function(node, objects)
{
  var collectedObjects = objects ? objects : {};

  var objId = node.getAttribute('xuljet:attachedObjects');
  if (objId)
  {
    collectedObjects[objId] = node.attachedObjects;
  }
  
  var child = node.firstChild;
  while (child) {
    if (child.nodeType === 1) {
      collectAttachedObjects(child, collectedObjects)
    }
    child = child.nextSibling;
  }
  
  return collectedObjects;
}

var setAttachedObjects = function(node, objects)
{
  var objId = node.getAttribute('xuljet:attachedObjects');
  if (objId)
  {
    node.attachedObjects = objects[objId];
    var propertyBinding = node.attachedObjects['propertyBinding'];
    if (propertyBinding)
      propertyBinding.object[propertyBinding.property] = node;
  }
  
  var child = node.firstChild;
  while (child) {
    if (child.nodeType === 1) {
      setAttachedObjects(child, objects)
    }
    child = child.nextSibling;
  }
}

var replaceComponentInDocument = function(aDocument, id, newNodes)
{  
  var startNode = aDocument.getElementById('__start_'+id);
  var endNode = aDocument.getElementById('__end_'+id);
  var currentNode = startNode;
  var parentNode = currentNode.parentNode;  
  
  while (currentNode.nextSibling && (currentNode.nextSibling != endNode))
  {
    parentNode.removeChild(currentNode.nextSibling);
  }
  
  newNodes.forEach(function(node) {
    var clonedNode = node.cloneNode(true);
    var attachments = collectAttachedObjects(node);
    setAttachedObjects(clonedNode, attachments);  
    parentNode.insertBefore(clonedNode, endNode);  
  });
   
  startNode.parentNode.removeChild(startNode);
  endNode.parentNode.removeChild(endNode);
}
exports.replaceComponentInDocument = replaceComponentInDocument;


var replaceBodyInDocument = function(aDocument, newNodes)
{    
  newNodes.forEach(function(node) {
    var clonedNode = node.cloneNode(true);
    var attachments = collectAttachedObjects(node);
    setAttachedObjects(clonedNode, attachments);  
    aDocument.body.appendChild(clonedNode);  
  });
}

var processFormNode = function(node, formNodes)
{
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
    //  if (node.getAttribute('xuljet:linkedWithForm') == true)
        formNodes.push(node); 
      break;
    default: break;
  };
  var children = node.childNodes;
  for (var i = 0; i < children.length; i++) {
    processFormNode(children[i], formNodes)
  }  
}  

var processFormInDocument = function(aDocument, id, pushToReceiver)
{  
  var startNode = aDocument.getElementById('__start_'+id);
  var endNode = aDocument.getElementById('__end_'+id);
   
  var currentNode = startNode;
  var parentNode = currentNode.parentNode;  
  
  var formNodes = new Array();
  
  while (currentNode && (currentNode != endNode))
  {
    processFormNode(currentNode, formNodes);
    currentNode = currentNode.nextSibling;
  }
  
  var result = {}
  
  formNodes.forEach(function(node) {
    var name = node.getAttribute('xuljet:name');
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
        if (node.attachedObjects) {
          var collection = node.attachedObjects['attachedObject'];
          if (collection)
          {
            if (node.selectedItem)
            {
              var index = node.selectedItem.getAttribute('xuljet:value')
              if (collection)
                val = collection[parseInt(index, 10)]  
              else
                val = index
            } else
              val = node.value;
          }
        }  
        break;
      case 'listbox': 
      case 'richlistbox': 
        if (node.attachedObjects) {
          var selectedCount = node.selectedCount;
          var collection = node.attachedObjects['attachedObject'];
          if (collection) {
            val = [];
            for (var a=0; a<selectedCount; a++)
            {
              var index = node.getSelectedItem(a).getAttribute('xuljet:value');
              if (collection)
                val.push(collection[parseInt(index, 10)])  
              else
                val.push(index)
            }
          }
        }
        break;
      default: 
        val = node.value;
    }
    result[name] = val;
    if (pushToReceiver && node.attachedObjects && node.attachedObjects['formReceiver'])
    {
      var array = node.attachedObjects['formReceiver'];
      if (array.length == 1) 
      {
        alert(node.getAttribute('xuljet:name'))
        exports.inspect(array[0])
      }
      var splitted = array[1].split('.');
      var currentReceiver = array[0];
      var lastProperty = splitted.pop();
      splitted.forEach(function (each) {
        currentReceiver = currentReceiver[each]
      })   
      
      currentReceiver[lastProperty] = val;
    } })
    
  return result;      
}

var reloadFormInDocument = function(aDocument, id)
{  
  try {
  
  var startNode = aDocument.getElementById('__start_'+id);
  var endNode = aDocument.getElementById('__end_'+id);
  
  var currentNode = startNode;
  var parentNode = currentNode.parentNode;  
  
  var formNodes = new Array();
  
  while (currentNode && (currentNode != endNode))
  {
    processFormNode(currentNode, formNodes);
    currentNode = currentNode.nextSibling;
  }
    
  formNodes.forEach(function(node) {
    
    var val = undefined;

    if (node.attachedObjects && node.attachedObjects['formReceiver'])
    {
      var array = node.attachedObjects['formReceiver'];
      var splitted = array[1].split('.');
      val = array[0];
      splitted.forEach(function (each) {
        val = val[each]
      })    
    }  
    
    var safeVal = (val == undefined || val == null) ? '' : val;
    
    var name = node.getAttribute('xuljet:name');
      switch (node.tagName)
      {
        case 'textbox': 
          node.value = safeVal;
          break;
        case 'checkbox': 
          node.checked = val;
          break;
        case 'colorpicker': 
          node.color = val; 
          break;
        case 'datepicker': 
    //    case 'timepicker': 
          node.dateValue = val; 
          break;
  /*    case 'menulist': 
        case 'radiogroup': 
      if (node.attachedObjects) {
        var collection = node.attachedObjects['attachedObject'];
        if (collection)
        {
        if (node.selectedItem)
        {
          var index = node.selectedItem.getAttribute('xuljet:value')
          if (collection)
          val = collection[parseInt(index, 10)]  
          else
          val = index
        } else
          val = node.value;
        }
      }  
      break;
        case 'listbox': 
      if (node.attachedObjects) {
        var selectedCount = node.selectedCount;
        var collection = node.attachedObjects['attachedObject'];
        if (collection) {
        val = [];
        for (var a=0; a<selectedCount; a++)
        {
          var index = node.getSelectedItem(a).getAttribute('xuljet:value');
          if (collection)
          val.push(collection[parseInt(index, 10)])  
          else
          val.push(index)
        }
        }
      }
          break;
  */    default: 
          node.value = val;
      }
        
      }
    )
  } catch (e) {alert(e)}
}

// Window

exports.Window = function(component, title)
{
  this.onWindowOpened = function(newWin) {
    exports.extend(newWin, exports.Window.prototype);
    newWin.xuljet = {};
    newWin._XULJetClosureRegistry = window._XULJetClosureRegistry;
    newWin.setTitle(title);
    component.setWindow(newWin);
    var roots = component.rendered();
    replaceComponentInDocument(newWin.document, 'windowComponent', roots)
    component.finishRenderingWithChildren();
  } 
}

exports.Window.prototype.open = function()
{
/*  var params = [this.onWindowOpened]
  
  var array = Components.classes['@mozilla.org/array;1']
            .createInstance(Components.interfaces.nsIMutableArray);
  for (var i = 0; i < params.length; i++)
  {
    var variant = Components.classes['@mozilla.org/variant;1']
                .createInstance(Components.interfaces.nsIWritableVariant);
    variant.setFromVariant(params[i]);
    array.appendElement(variant, false);
  }
*/
  var windowWatcher = Components.classes['@mozilla.org/embedcomp/window-watcher;1'].getService(Components.interfaces.nsIWindowWatcher); 
  var newWindow = windowWatcher.openWindow(exports.Window.main, 'empty.xul', '_blank', 'chrome',null); 
  newWindow['__param_onWindowOpended'] = this.onWindowOpened;
  return newWindow;
}

exports.Window.prototype.setTitle = function(aString)
{
  this.document.title = aString;
}
  
exports.Window.prototype.rootNode = function()
{
  return this.document.getElementsByTagName('window')[0];
}

exports.Dialog = function(component, title)
{
  this.onDialogOpened = function(newWin) {
    exports.extend(newWin, exports.Dialog.prototype);  
    newWin.xuljet = {};
    newWin._XULJetClosureRegistry = window._XULJetClosureRegistry;
    newWin.setTitle(title);
    component.setWindow(newWin);
    var roots = component.rendered();
    replaceComponentInDocument(newWin.document, 'windowComponent', roots)
    component.finishRenderingWithChildren();
  }  
}
exports.inherits(exports.Dialog, exports.Window);

exports.Dialog.prototype.open = function()
{
  return exports.Window.main.openDialog('emptyDialog.xul', '_blank', 'chrome,dialog,alwaysRaised,dependent,centerscreen',
                null,
                this.onDialogOpened,
                this.actions);
}

exports.config = {};

//exports.config.preferencesBranch = Components.classes['@mozilla.org/preferences-service;1'].
//                    getService(Components.interfaces.nsIPrefBranch);

exports.config.set = function (name, value) 
{
  switch (typeof value)
  {
    case 'boolean': 
      exports.config.preferencesBranch.setBoolPref(name, value);
      break;
    case 'number': 
      exports.config.preferencesBranch.setBoolPref(name, value);
      break;
    case 'string': 
      var supportString = Components.classes['@mozilla.org/supports-string;1'].createInstance(Components.interfaces.nsISupportsString);
      supportString.data = value;
      exports.config.preferencesBranch.setComplexValue(name, Components.interfaces.nsISupportsString, supportString);
      break;
  }
};

exports.config.get = function (name, defaultValue) 
{
  var type = exports.config.preferencesBranch.getPrefType(name);

  if (typeof defaultValue == 'undefined') defaultValue = null;
    
  switch (type) 
  {
    case 32:
      try {
          var str = exports.config.preferencesBranch.getComplexValue(name, Components.interfaces.nsISupportsString);
          return str.data;
      } catch (e) {
        exports.config.set(name, defaultValue)    
        return defaultValue;
      }
    case 64:
      return exports.config.preferencesBranch.getIntPref(name);
    case 128:
      return exports.config.preferencesBranch.getBoolPref(name);
    default: break;
  }
  exports.config.set(name, defaultValue)    
  return defaultValue;
};

exports.config.save = function()
{
  var prefService = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefService);
  prefService.savePrefFile(null);
}

exports.getContents = function(aURI, charset){
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

exports.homeDir = function()
{
  var dirService = Components.classes['@mozilla.org/file/directory_service;1']
                     .getService(Components.interfaces.nsIProperties);   
  var homeDirFile = dirService.get('Home', Components.interfaces.nsIFile); // returns an nsIFile object  
  return homeDirFile.path;
}

exports.isJitEnabled = function()
{
  var prefs = Components.classes['@mozilla.org/preferences-service;1']
                .getService(Components.interfaces.nsIPrefService).getBranch('javascript.options.jit.');
  return prefs.getBoolPref('content'); 
}

exports.systemPopup = function(title, text) 
{  
  try {  
    Components.classes['@mozilla.org/alerts-service;1'].  
              getService(Components.interfaces.nsIAlertsService).  
              showAlertNotification(null, title, text, false, '', null);  
  } catch(e) {  
    // prevents runtime error on platforms that don't implement nsIAlertsService  
  }  
}  

exports.urlExists = function(anURI)
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

exports.beep = function()
{
  var sound = Components.classes["@mozilla.org/sound;1"]
  .createInstance(Components.interfaces.nsISound);
  sound.beep();
}

var localeURI = function(packageName, localeName)
{
  return exports.localesURI + packageName + '.' + localeName + '.txt'
}

var parseXML = function(sXML) 
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


var getStringBundle = function(localeName, fallbackLocale, packageName)
{
  var currentLocale = localeName;
  var bundleId = '__' + packageName + '_stringbundle';
  var mainWindow = exports.Window.main;
  if (!mainWindow)
    mainWindow = window;
  
  var stringBundle = mainWindow.document.getElementById(bundleId)
  if (stringBundle)
    return stringBundle;    
    
  if (!exports.urlExists(localeURI(packageName, currentLocale)))
  {
    currentLocale = fallbackLocale;
    if (!exports.urlExists(localeURI(packageName, currentLocale)))
      currentLocale = undefined;
  }
  
  var finalURI = currentLocale ? localeURI(packageName, currentLocale) : ''
    
  var node = exports.Window.main.document.createElementNS(exports.XUL_NS, 'stringbundle');
  node.setAttribute('id', bundleId);
  node.setAttribute('src', finalURI);
  stringBundle = node.cloneNode(true);
  exports.Window.main.rootNode().appendChild(stringBundle);
  
  return stringBundle
}

var setupLocale = function()
{
  var localeService = Components.classes['@mozilla.org/intl/nslocaleservice;1']
        .getService(Components.interfaces.nsILocaleService);
  var localeInfo = localeService.getApplicationLocale(); 
  
  var messagesLocale = localeInfo.getCategory('NSILOCALE_MESSAGES');
  var fallbackLocale = 'en_US';
  
  var stringBundle = getStringBundle(messagesLocale, 'en-US', 'strings') ;
  
  exports.locale = {
    name: messagesLocale, 
    info: {
      messages: messagesLocale, 
      time: localeInfo.getCategory('NSILOCALE_TIME'), 
      numericc: localeInfo.getCategory('NSILOCALE_NUMERIC'), 
      monetary: localeInfo.getCategory('NSILOCALE_MONETARY'), 
      ctype: localeInfo.getCategory('NSILOCALE_CTYPE'), 
      collate: localeInfo.getCategory('NSILOCALE_COLLATE'),
      },
    collator: Components.classes['@mozilla.org/intl/collation-factory;1']
        .getService(Components.interfaces.nsICollationFactory)
        .CreateCollation(localeService.getApplicationLocale()),
    stringbundle: stringBundle,
    fallbacklocale: fallbackLocale,
  }
}

exports.makeTagHelpers(exports.XULCanvas, exports.XUL_NS, '');
exports.makeTagHelpers(exports.HTMLCanvas, exports.HTML_NS, 'html:');
exports.makeTagHelpers(exports.SVGCanvas, exports.SVG_NS, 'svg:');

var onMainWindowOpened = function(loadEvt)
{
  exports.extend(window, exports.Window.prototype);
  exports.Window.main = window;
  if(typeof(main) !== 'undefined')       // use this form to prevent warning
  {
  //  var cmdLine = window.arguments[0];
  //  alert(cmdLine)
    //cmdLine = cmdLine.QueryInterface(Components.interfaces.nsICommandLine);
    setupLocale();
    main();  
  }
}

window.addEventListener('load', onMainWindowOpened, false);



