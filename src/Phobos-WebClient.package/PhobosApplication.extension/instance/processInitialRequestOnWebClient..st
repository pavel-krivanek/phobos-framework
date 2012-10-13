*Phobos-WebClient
processInitialRequestOnWebClient: request 

	| session |
	session := self sessionClass new.
	PhobosCurrentSession use: session during: [
		self onNewClient.
		^ request send200Response: 'Phobos' contentType: 'text/text'. ]