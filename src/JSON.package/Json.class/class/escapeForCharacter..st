as yet unclassified
escapeForCharacter: c
	
	| index |
	^ (index := c asciiValue + 1) <= escapeArray size
		ifTrue: [ escapeArray at: index ]
		ifFalse: [ c ]