as yet unclassified
initialize

	super initialize.
	
	child := self pages first value on: self window.	
	source := PhobosCodeEditor on: self window.
	source initialContent: (String streamContents: [:s | child class fileOutOn: s ]).
		
	self windowTitle: 'Phobos Demo'.
		
