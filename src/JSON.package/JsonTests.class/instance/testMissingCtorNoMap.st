as yet unclassified
testMissingCtorNoMap
	self 
		should: [Json new readFrom: '@Missing[]' readStream]
		raise: JsonSyntaxError