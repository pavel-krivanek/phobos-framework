as yet unclassified
testWriteString
	self render: '"' equals: '"\""'.
	self render: '\' equals: '"\\"'.
	self render: 'hi' equals: '"hi"'.
	self render: ({$a. Character lf. $b} as: String) equals: '"a\nb"'.
	self render: ({$a. Character value: 4. $b} as: String) equals: '"a\u0004b"'.