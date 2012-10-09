accessing
newWindowWith: aComponentClass

	| winId component msg renderer |

	winId := WAContinuation currentDo: [:cc |
		| cid newMessage |
		cid := self session registerClosure: [:res | cc value: res].
		newMessage := PhobosMessage new.
		newMessage type: #openWindow.
		newMessage window: self window.
		newMessage argument: cid.
		PhobosCurrentSession value webSocket sendMessage: (Json render: newMessage ).

		PhobosContinuationNotification signal.].

	self session registerWindow: winId.
	
	component := aComponentClass on: winId.
	renderer := component rendered.
	msg := PhobosMessage new.
	msg type: #replaceComponentInDocument.
	msg window: winId.
	msg target: 'windowComponent'.
	msg content: (Json render: renderer).
	self session webSocket sendMessage: (Json render: msg ).	
	
	component finishRenderingWithChildren.
	
	^ component.

