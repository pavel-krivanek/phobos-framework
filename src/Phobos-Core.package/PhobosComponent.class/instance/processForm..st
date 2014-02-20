accessing
processForm: aForm
	
	| msg |
	
	Continuation currentDo: [:cc |
		| cid |
		cid := self registerClosure: [:res | cc value: res].
		msg := PhobosMessage new.
		msg type: #processForm.
		msg window: self window.
		msg argument: aForm id.
		msg target: cid.
		self session webSocket sendMessage: (Json render: msg ).
 
		PhobosContinuationNotification signal. ].
	
