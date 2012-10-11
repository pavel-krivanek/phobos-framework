as yet unclassified
update: aSymbol 

	| script |
		
	aSymbol ifNil: [^self].
	aSymbol == #flash ifTrue: [^self flash].
	aSymbol == getTextSelector 
		ifTrue: 
			[ 
			[script := 'editAreaLoader.setValueEscaped("', self editorId, '", "', self getText asString xulEscape ,'")'. ].
			"SeasideXULUIManager evaluateScript: script."
			^ self.
			"SeasideXULUIManager getScriptResult: 'editAreaLoader.setValue(id, ' andDo:  [:result | self ].
			self setText: self getText.
			^ self refresh"].
	aSymbol == getSelectionSelector 
		ifTrue: [^self setSelection: self getSelection].
	(aSymbol == #autoSelect and: [getSelectionSelector notNil]) 
		ifTrue: 
			[ ].
	aSymbol == #clearUserEdits ifTrue: [^self hasUnacceptedEdits: false].
	aSymbol == #wantToChange 
		ifTrue: 
			[self canDiscardEdits ifFalse: [^self promptForCancel].
			^self].
	aSymbol == #appendEntry 
		ifTrue: 
			[self handleEdit: [self appendEntry].
			^self refreshWorld].
	aSymbol == #clearText 
		ifTrue: 
			[self handleEdit: [self changeText: Text new].
			^self ].
	aSymbol == #bs 
		ifTrue: 
			[self handleEdit: [self bsText].
			^self ].
	aSymbol == #codeChangedElsewhere 
		ifTrue: 
			[self hasEditingConflicts: true.
			^self changed]