as yet unclassified
handleTextRequest: request

	| script |
	
	script := 'promptWithCancelValue("', (self encodeStringToJS: request prompt), '", "', (self encodeStringToJS: request template), '", "', self cancelValue, '") '.

	^ self getScriptResult: script andDo: [:result | 
		result = self cancelValue ifTrue: [ nil] ifFalse: [result] ].

