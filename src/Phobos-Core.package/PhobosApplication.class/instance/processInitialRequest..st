as yet unclassified
processInitialRequest: request 

	| session |
	session := self sessionClass new.
	PhobosCurrentSession use: session during: [
		self onNewClient.
		^ ZnResponse ok: (ZnEntity text: 'Phobos')]