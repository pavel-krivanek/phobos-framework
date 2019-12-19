as yet unclassified
render: anObject withConstructor: aConstructorName on: aStream
	aStream nextPutAll: '@', aConstructorName.
	anObject jsonWriteOn: aStream.
