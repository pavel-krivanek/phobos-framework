as yet unclassified
update: aSymbol
	
	aSymbol == #commands ifTrue: [self updateCommands].
	
	self refresh.