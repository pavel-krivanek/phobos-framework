*JSON-writing
jsonWriteOn: aStream

	| replacement |
	aStream nextPut: $".
	self do: [ :ch |
		replacement := (Json escapeForCharacter: ch) asString.
		aStream nextPutAll:  replacement ].
	aStream nextPut: $".
