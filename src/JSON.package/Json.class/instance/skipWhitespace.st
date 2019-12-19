private
skipWhitespace
	[stream peek isSeparator] whileTrue: [stream next].
	self skipComment.