as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; with: [
			list renderOn: xul. 
	
		button ifNotNil: [  
			button renderOn: xul]].