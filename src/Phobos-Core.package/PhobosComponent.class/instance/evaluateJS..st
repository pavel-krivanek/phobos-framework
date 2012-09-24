as yet unclassified
evaluateJS: aScript

	| result |
	result := WAContinuation currentDo: [:cc |
		| cid newMessage |
		cid := self registerClosure: [:res | cc value: res].
		newMessage := PhobosMessage new.
		newMessage type: #evaluateJS.
		newMessage window: self window.
		newMessage target: cid.
		newMessage content: aScript.
		self session webSocket sendMessage: (Json render: newMessage ).

		PhobosContinuationNotification signal.].
	^ result.