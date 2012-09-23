as yet unclassified
setAttribute: anAttributeName to: aValue

	| msg | 

	self assert: self id notNil.
	
	msg := PhobosMessage new.
	msg type: #setAttribute.
	msg window: nil.
	msg target: id.
	msg content: anAttributeName asString.
	msg argument: aValue.
	PhobosCurrentSession value webSocket sendMessage: (Json render: msg ).	
	

	
	