*JSON-writing
jsonWriteOn: aStream
	self key asString jsonWriteOn: aStream.
	aStream nextPut: $:; space.
	self value jsonWriteOn: aStream.