as yet unclassified
jsonWriteOn: s
	
	| needComma |

	needComma := false.

	s nextPut: ${.
		s nextPutAll: '"namespace":'. self namespace jsonWriteOn: s.
		s nextPutAll: ', "prefix":'. '' jsonWriteOn: s.
		s nextPutAll: ', "tagName":'. self tag jsonWriteOn: s.
		s nextPutAll: ', "attributes":['.
			(attributes ifNil: #()) do: [:attr |
				needComma
					ifTrue: [ s nextPut: $, ]
					ifFalse: [ needComma := true ].
				s nextPutAll: '{'.
					s nextPutAll: '"key":'. attr key jsonWriteOn: s.
					s nextPutAll: ', "value":'. attr value jsonWriteOn: s.
				s nextPutAll: '}'].
		s nextPutAll: '], "text":'. '' jsonWriteOn: s.
		s nextPutAll: ', "children": '. children jsonWriteOn: s.
	s nextPut: $}.
	
															
