as yet unclassified
handleChoiceRequest: request

	| script labels title question |

	labels := self encodeArrayToJS: (request labels).
	title := 'select one'.
	question := self encodeStringToJS: (request prompt ifNil: ['']).
	script := 'xulSelectDialog(', labels, ', "', title, '", "', question, '", "', self cancelValue, '")'.

	^ self getScriptResult: script andDo: [:result | 
		result = self cancelValue ifTrue: [ nil] ifFalse: [ request values at: result asInteger+1 ] ].

	