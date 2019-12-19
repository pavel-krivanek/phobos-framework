private
consume: aString returning: anObject
	aString do: [:c | stream next == c ifFalse: [JsonSyntaxError signal: 'Expected ''', aString, ''''] ].
	^ anObject