accessing
processMessage: message

	| xul msg |
	
	[
	
	msg := PhobosMessage from: message.
	(msg type = #getMainWindowComponent) ifTrue: [
		| newMessage |
		self registerWindow: #mainWindow.
		xul := (self getMain: #mainWindow) rendered.
		newMessage := PhobosMessage new.
		newMessage type: #replaceComponentInDocument.
		newMessage window: #mainWindow.
		newMessage target: #mainWindowComponent.
		newMessage content: (Json render: xul).
		self webSocket sendMessage: (Json render: newMessage ).
		].
	
	(msg type = #runClosure) ifTrue: [
		(closures at: msg target) value.
		].	
		
	(msg type = #returnValue) ifTrue: [
		(closures at: msg target) value: msg argument.
		closures removeKey: msg target.
		].			
		
	] on: PhobosContinuationNotification do: [:n | "do nothing" ].
"
xul := PhobosXULCanvas new.

xul button label: 'myclass'.

	self inform: message.
	self webSocket sendMessage: (Json render: xul).
"
