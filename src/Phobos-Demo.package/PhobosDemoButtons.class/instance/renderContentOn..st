as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Buttons'.].

		self renderButtonsTabOn: xul.
		self renderButtonsAccessOn: xul.
		xul hbox with: [
			self renderButtonsStatesOn: xul.
			self renderMenuButtonsOn: xul.].
		self renderButtonsLabelingOn: xul.

	]