accessing
currentTag: anObject
	
	parentCanvas 
		ifNil: [ currentTag := anObject ]
		ifNotNil: [parentCanvas currentTag: anObject]

