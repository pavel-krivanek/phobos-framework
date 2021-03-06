*Phobos-WebClient
startOnWebClient
	
	| sockets sessions |
	
	sessions := Set new.
	sockets := OrderedCollection new.

	server := WebServer reset default listenOn: self port.
	
	WebServer default addService: '/serverRunning' action:[:req|
		"Serves the main html chat page"
		req send200Response: 'serverRunning' contentType: 'text/text'.
	].	
	
	WebServer default addService: '/newSession' action:[:req| 
		| webSocket session |
		webSocket := req asWebSocket.
		webSocket timeout: 172800. "two days" 

		session := self sessionClass new.
		session application: self.
		session webSocket: webSocket.
		sessions add: session.

		webSocket onMessage:[:data|
			PhobosCurrentSession use: session during: [
				session processMessage: data
			]].	
		
		webSocket onError:[:ex|
			Transcript cr; show: webSocket.
			Transcript cr; show: ex description.
			Transcript cr; show: ex signalerContext longStack.
		].

		webSocket onClose:[
			sessions remove: (sessions detect: [:s | s webSocket = webSocket]) ifAbsent: [ ]].			
			
		webSocket run.
		].
	
	
	