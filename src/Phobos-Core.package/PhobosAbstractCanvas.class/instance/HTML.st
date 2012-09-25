accessing
HTML

	| htmlCanvas |
	
	htmlCanvas := PhobosHTMLCanvas for: self component.
	htmlCanvas parentCanvas: self.
	^ htmlCanvas.