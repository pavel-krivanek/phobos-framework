as yet unclassified
add: aString target: anObject selector: aSymbol enabled: aBoolean icon: anIcon keystroke: aKeystroke
	items add: (OBPhobosMenuItem new
		label: aString;
		target: anObject;
		selector: aSymbol;
		enabled: aBoolean;
		icon: anIcon;
		"keystroke: aKeystroke"
		yourself)