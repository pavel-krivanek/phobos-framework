accessing
replace: aComponent with: aRenderer

	| msg |
	
	msg := PhobosMessage new.
	msg type: #replaceComponentInDocument.
	msg window: aComponent window.
	msg target: aComponent id.
	msg content: (Json render: aRenderer).
	self webSocket sendMessage: (Json render: msg ).
	