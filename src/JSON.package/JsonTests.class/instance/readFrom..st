as yet unclassified
readFrom: aString
	^ (Json newWithConstructors: {JsonDummyTestObject.}) readFrom: aString readStream
