as yet unclassified
testStringWithUnicode
	self json: '"\u263A"' equals: (Unicode value: 16r263A) asString.
	self render: (Unicode value: 16r263A) asString equals: '"\u263A"'.