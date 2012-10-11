as yet unclassified
handleConfirmationRequest: request


	| script |
	
	script := 'confirm("', (self encodeStringToJS: request prompt), '")'.

	^ self getScriptResult: script andDo: [:result | 
		result = 'true' ].
