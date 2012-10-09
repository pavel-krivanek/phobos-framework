accessing
windowTitle: aString
	
	| msg |

	msg := PhobosMessage new.
	msg type: #setWindowTitle.
	msg window: self window.
	msg argument: aString.
	self session webSocket sendMessage: (Json render: msg ).

	
