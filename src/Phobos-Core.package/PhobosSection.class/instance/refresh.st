accessing
refresh

	self canvas reset.
	self canvas sectionStart: self id.
	block value.
	self canvas sectionEnd: self id.
	self canvas component session replace: self with: self canvas.
