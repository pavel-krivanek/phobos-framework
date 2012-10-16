as yet unclassified
renderContentOn: xul
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [
		
		self renderIntegerInputsOn: xul.
		self renderDateInputsOn: xul
	].

	