as yet unclassified
initialize

	super initialize.
	
	workspace := PhobosCodeEditor on: self window.
	
	workspace initialContent: '
	
3 + 4
	
OBSystemBrowser open.

'