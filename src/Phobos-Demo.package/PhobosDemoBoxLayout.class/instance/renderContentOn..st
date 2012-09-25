as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Box Layout'.].

		self renderFlexinesOn: xul.
		self renderDirectionOn: xul.
		self renderPackingOn: xul.
		self renderAlignmentOn: xul.
		self renderEqualityOn: xul.
		self renderHiddenessOn: xul.

	]