as yet unclassified
setContent: aString

	| msg |
	
	browserReady ifFalse: [
		initialContent := aString.
		^ self.].
	
	msg := PhobosMessage new.
	msg type: #setCodeMirrorText.
	msg window: self window.
	msg argument: browser id.
	msg content: aString.
	self session webSocket sendMessage: (Json render: msg ).