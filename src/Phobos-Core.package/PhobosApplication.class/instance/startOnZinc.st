as yet unclassified
startOnZinc
	
	| repository location |
		
	repository := (IceRepository registry
		detect: [ :e | e name = 'phobos-framework' ] ifNone: [ nil ]). 
	location := repository 
		ifNotNil: [ repository location / 'static' ]
		ifNil: [ FileSystem workingDirectory / 'static' ].
		
	self  stop.
	server := ZnServer startOn: 8888.
	handler := PhobosWebSocketHandler new.
	handler application: PhobosAppHelloWorld new.

	server logToTranscript.
		
 	server delegate
		map: 'newSession' 
		to:  (ZnWebSocketDelegate map: 'newSession' to: handler).
		
	server delegate
		map: 'serverRunning' 
		to:  [ :request | ZnResponse ok: (ZnEntity text: 'serverRunning') ].
			
	server delegate
		map: '1.html' 
		to:  [ :request | ZnResponse ok: (ZnEntity html: ((location / '1.html') readStream upToEnd)) ].				
	
	server delegate
		map: 'script.js' 
		to:  [ :request | ZnResponse ok: (ZnEntity html: ((location / 'script.js') asFileReference readStream upToEnd)) ].				

	server delegate
		map: 'xuljet.js' 
		to:  [ :request | ZnResponse ok: (ZnEntity html: ((location / 'xuljet.js') asFileReference readStream upToEnd)) ].				
		