accessing
openInNewWindow

	| winId msg renderer |

	winId := Continuation currentDo: [:cc |
		| cid newMessage |
		cid := self session registerClosure: [:res | cc value: res].
		newMessage := PhobosMessage new.
		newMessage type: #openWindow.
		newMessage window: self window.
		newMessage argument: cid.
		PhobosCurrentSession value webSocket sendMessage: (Json render: newMessage ).

		PhobosContinuationNotification signal.].

	self session registerWindow: winId.
	
	self windowWithChildren: winId.
	renderer := self rendered.
	msg := PhobosMessage new.
	msg type: #replaceComponentInDocument.
	msg window: winId.
	msg target: 'windowComponent'.
	msg content: (Json render: renderer).
	self session webSocket sendMessage: (Json render: msg ).	
	
	self finishRenderingWithChildren.
	


