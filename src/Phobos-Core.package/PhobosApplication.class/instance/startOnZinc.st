as yet unclassified
startOnZinc
	
	self stop.
	server := ZnServer startOn: self port.
	handler := PhobosWebSocketHandler new.
	handler application: self.
			
 	server delegate
		map: 'newSession' 
		to:  (ZnWebSocketDelegate map: 'newSession' to: handler)."[ :request | self processInitialRequest: request ]."
		
	server delegate
		map: 'serverRunning' 
		to:  [ :request | ZnResponse ok: (ZnEntity text: 'serverRunning') ].