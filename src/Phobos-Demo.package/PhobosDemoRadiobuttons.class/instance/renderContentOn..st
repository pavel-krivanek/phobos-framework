as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'XUL Checkboxes'.]."

		xul hbox with: [		
			self renderButtonsStatesOn: xul.
			self renderButtonsAccessOn: xul.].
		xul hbox with: [
			self renderButtonsOrientationOn: xul.
			self renderButtonsImagesOn: xul.].
	]