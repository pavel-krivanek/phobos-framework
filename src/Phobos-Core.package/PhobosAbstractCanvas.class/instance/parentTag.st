accessing
parentTag
	
	^ parentCanvas 
		ifNil: [ parentTag ]
		ifNotNil: [parentCanvas parentTag]