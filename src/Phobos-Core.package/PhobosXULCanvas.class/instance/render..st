as yet unclassified
render: aComponent

	aComponent clearClosures.
	self sectionStart: aComponent id.
	aComponent renderContentOn: self.
	self sectionEnd: aComponent id.
