accessing
render: aComponent

	aComponent ifNil: [ ^ self.].

	aComponent clearClosures.
	self sectionStart: aComponent id.
	aComponent renderOn: self.
	self sectionEnd: aComponent id.
