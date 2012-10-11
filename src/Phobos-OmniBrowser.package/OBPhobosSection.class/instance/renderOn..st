as yet unclassified
renderOn: xul
	
	| aBlock | 
	
	aBlock := [ self renderContentOn: xul ].
	
	self window: xul component window.
	self block: aBlock.
	self canvas: xul.
	
	xul sectionStart: self id.
	aBlock value.
	xul sectionEnd: self id.
