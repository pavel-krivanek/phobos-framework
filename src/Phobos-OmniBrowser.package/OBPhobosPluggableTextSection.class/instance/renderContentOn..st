as yet unclassified
renderContentOn: xul 

	editor setContent: (self getText).
	xul render: editor.
	