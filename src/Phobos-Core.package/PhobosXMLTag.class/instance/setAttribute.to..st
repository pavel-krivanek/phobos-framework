as yet unclassified
setAttribute: anAttributeName to: aValue

	| msg | 

	self assert: self id notNil.
	
	msg := PhobosMessage new.
	msg type: #setAttribute.
	msg window: self canvas component window.
	msg target: id.
	msg content: anAttributeName asString.
	msg argument: aValue.
	self canvas component session webSocket sendMessage: (Json render: msg ).	
	

	
	