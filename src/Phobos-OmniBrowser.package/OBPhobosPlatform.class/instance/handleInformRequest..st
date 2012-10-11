as yet unclassified
handleInformRequest: request


	| script |
	
	script := 'alert("', (self encodeStringToJS: request message), '")'.

	^ self getScriptResult: script andDo: [:result | self ].
