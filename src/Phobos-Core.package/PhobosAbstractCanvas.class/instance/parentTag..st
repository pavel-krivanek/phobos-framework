accessing
parentTag: anObject
	
	parentCanvas 
		ifNil: [ currentTag := anObject ]
		ifNotNil: [parentCanvas parentTag: anObject]
