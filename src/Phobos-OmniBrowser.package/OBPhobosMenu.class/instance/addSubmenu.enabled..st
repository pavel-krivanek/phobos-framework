as yet unclassified
addSubmenu: aString enabled: aBoolean

	| submenu |
	
	submenu := OBPhobosMenu new
		label: aString;
		enabled: aBoolean;
		yourself.

	items add: submenu.
	
	^ submenu
	
