as yet unclassified
form: aBlock

	| form |
	
	form := PhobosForm new.
	form window: self component window.
	form block: aBlock.
	form canvas: self.
	
	self sectionStart: form id.
	aBlock value.
	self sectionEnd: form id.

	^ form