as yet unclassified
finishRendering

	| msg cid |

	browser ifNil: [^ super finishRendering].
	
	cid := browser canvas component registerClosure: [:res | 
		browserReady := true.
		self setContent: self initialContent		.].
	
	msg := PhobosMessage new.
	msg type: #setBrowserFinishCallback.
	msg window: browser canvas component window.
	msg argument: browser id.
	msg target: cid.
	browser canvas component session webSocket sendMessage: (Json render: msg ).
	
	super finishRendering.
	