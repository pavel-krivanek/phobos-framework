as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'XUL Checkboxes'.]."

		xul hbox with: [
			self renderButtonsTabOn: xul.
			self renderButtonsAccessOn: xul.
			self renderButtonsStatesOn: xul.].
		xul hbox with: [
			self renderButtonsOrientationOn: xul.
			self renderButtonsImagesOn: xul.].
	]