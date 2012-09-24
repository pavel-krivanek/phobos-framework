as yet unclassified
processMessage: aMessage socket: aWebSocket

	| session |
	session := self sessionClass new.
	session webSocket: aWebSocket.