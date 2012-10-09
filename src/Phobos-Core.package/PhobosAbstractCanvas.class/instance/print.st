accessing
print

	| msg | 
	
	msg := PhobosMessage new.
	msg type: #printNodes.
	msg window: self component window.
	msg content: (Json render: self).
	self component session webSocket sendMessage: (Json render: msg ).