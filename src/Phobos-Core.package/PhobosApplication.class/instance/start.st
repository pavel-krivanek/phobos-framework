as yet unclassified
start
	
	(Smalltalk hasClassNamed: #ZnServer)
		ifTrue: [ ^ self startOnZinc ].
		
	(Smalltalk hasClassNamed: #WebServer)
		ifTrue: [ ^ self startOnWebClient ].
		
	self error: 'no server found'.