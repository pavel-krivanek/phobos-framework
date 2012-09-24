accessing
value: webSocket
	
	[
		| session |
		session := self application sessionClass new.
		session application: self application.
		session webSocket: webSocket.
		sessions add: session.
		PhobosCurrentSession use: session during: [
			webSocket runWith: [ :message |
				session processMessage: message] ] ]
		on: ConnectionClosed 
		do: [
			sessions remove: (sessions detect: [:s | s webSocket = webSocket]) ifAbsent: [ ] ]
		
