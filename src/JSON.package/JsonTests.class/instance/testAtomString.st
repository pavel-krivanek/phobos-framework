as yet unclassified
testAtomString
	self json: '"hi"' equals: 'hi'.
	self json: '"\""' equals: '"'.
	self json: '"\\"' equals: '\'.
	self json: '""' equals: ''.
	self json: '"a\u0004b"' equals: ({$a. Character value: 4. $b} as: String).
	self json: '"a\nb"' equals: ({$a. Character lf. $b} as: String).