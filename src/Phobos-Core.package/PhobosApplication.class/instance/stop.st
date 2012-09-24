as yet unclassified
stop
	
	handler ifNotNil: [handler release].
	server ifNotNil: [server stop].	