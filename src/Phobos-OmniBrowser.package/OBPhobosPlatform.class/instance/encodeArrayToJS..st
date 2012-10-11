as yet unclassified
encodeArrayToJS: anArray

	^ String streamContents: [:str |
		str nextPutAll: '['.
		anArray size > 0 ifTrue: [
			anArray allButLastDo: [:item |
				str nextPutAll: '"';
					nextPutAll: (self encodeStringToJS: item displayString);
					nextPutAll: '",'.].
			str nextPutAll: '"';
				nextPutAll: (self encodeStringToJS: anArray last displayString);
				nextPutAll: '"'.].
		str nextPutAll: ']'.]
		
	
