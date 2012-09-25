accessing
render: aComponent

	aComponent ifNil: [ ^ self.].

	aComponent clearClosures.
	self sectionStart: aComponent id.
	aComponent renderContentOn: self.
	self sectionEnd: aComponent id.
