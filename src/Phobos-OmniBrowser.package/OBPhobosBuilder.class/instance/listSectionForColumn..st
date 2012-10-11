as yet unclassified
listSectionForColumn: aColumn

	^ OBPhobosPluggableListSection new
		model: aColumn;
		getListSelector: #list;
		getIndexSelector: #selection;
		setIndexSelector: #selection:;
		getMenuSelector: #menu:;
		getListElementSelector: #listAt:;
		getListSizeSelector: #listSize;
		"dragEnabled: aColumn dragEnabled;
		dropEnabled: aColumn dropEnabled;"
		autoDeselect: false;
		yourself.