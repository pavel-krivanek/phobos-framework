as yet unclassified
renderContentOn: xul	

	| singleState singleList multipleState multipleList | 
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'XUL Lists'.]."
	  xul vbox with: [		
		
		self renderStatesOn: xul.
		self renderSingleSelectOn: xul.
		self renderMultipleSelectOn: xul.
		self renderMultipleColumnsOn: xul

		
	
		]].		
			
