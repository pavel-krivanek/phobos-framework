as yet unclassified
window: aBrowser with: aBlock 
	| window |
	color := aBrowser defaultBackgroundColor.
	window := OBPhobosWindow labelled: aBrowser labelString.
	window model: aBrowser.
	^self current: window
		do: 
			[aBlock value.
			self layoutPanels]