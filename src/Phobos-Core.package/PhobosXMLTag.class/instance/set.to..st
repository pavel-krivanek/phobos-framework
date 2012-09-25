as yet unclassified
set: aPropertyName to: aValue

	| msg | 

	self assert: self id notNil.
	
	msg := PhobosMessage new.
	msg type: #setProperty.
	msg window: self canvas component window.
	msg target: id.
	msg content: aPropertyName asString.
	msg argument: aValue.
	self canvas component session webSocket sendMessage: (Json render: msg ).	
	

	
	