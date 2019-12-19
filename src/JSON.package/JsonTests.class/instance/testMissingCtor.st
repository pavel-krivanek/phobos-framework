as yet unclassified
testMissingCtor
	self 
		should: [self readFrom: '@Missing[]']
		raise: JsonSyntaxError
