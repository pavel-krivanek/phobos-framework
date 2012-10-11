as yet unclassified
renderContentOn: xul

	self renderMenuOn: xul.

	xul vbox flex: 1; with: [
		self renderContentPaneOn: xul.].
	
	self renderStatusBarOn: xul.
	
	