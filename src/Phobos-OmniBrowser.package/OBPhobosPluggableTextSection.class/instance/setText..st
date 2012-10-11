as yet unclassified
setText: aString

	aString asString displayAt: 10@10.

	text := aString.
	self hasUnacceptedEdits: false.