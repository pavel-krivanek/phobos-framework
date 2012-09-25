as yet unclassified
get: aPropertyName

	| result | 

	self assert: self id notNil.
	
	result := WAContinuation currentDo: [:cc |
		| cid newMessage |
		cid := PhobosCurrentSession value registerClosure: [:res | cc value: res].
		newMessage := PhobosMessage new.
		newMessage type: #getProperty.
		newMessage window: self canvas component window.
		newMessage target: id.
		newMessage content: aPropertyName asString.
		newMessage argument: cid.
		PhobosCurrentSession value webSocket sendMessage: (Json render: newMessage ).

		PhobosContinuationNotification signal.].
	^ result.	
	
	