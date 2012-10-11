as yet unclassified
setText: aString
self halt.
	aString asString displayAt: 10@10.

	text := aString.
	self hasUnacceptedEdits: false.