as yet unclassified
section: aBlock

	| section |
	
	section := PhobosSection new.
	section window: self component window.
	section block: aBlock.
	section canvas: self.
	
	self sectionStart: section id.
	aBlock value.
	self sectionEnd: section id.

	^ section