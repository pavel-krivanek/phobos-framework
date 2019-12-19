private
readDictionary
	| m k v needComma |
	m := JsonObject new.
	needComma := false.
	[
		self skipWhitespace.
		(stream peekFor: $}) ifTrue: [ ^ m].
		needComma
			ifTrue: [ (stream peekFor: $,) ifFalse: [JsonSyntaxError signal: 'Missing comma'].
					self skipWhitespace]
			ifFalse: [needComma := true].
"		k := self readAny. "
		(stream peekFor: $") ifFalse: [JsonSyntaxError signal: 'Key in dictionary must be string'].
		k := self readString.
		self skipWhitespace.
		(stream peekFor: $:) ifFalse: [JsonSyntaxError signal: 'Missing colon'].
		v := self readAny.
		m at: k put: v.
	] repeat.
