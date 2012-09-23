as yet unclassified
set: aPropertyName to: aValue

	| msg | 

	self assert: self id notNil.
	
	msg := PhobosMessage new.
	msg type: #setProperty.
	msg window: nil.
	msg target: id.
	msg content: aPropertyName asString.
	msg argument: aValue.
	PhobosCurrentSession value webSocket sendMessage: (Json render: msg ).	
	

	
	