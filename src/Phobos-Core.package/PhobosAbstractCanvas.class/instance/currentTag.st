accessing
currentTag
	
	^ parentCanvas 
		ifNil: [ currentTag ]
		ifNotNil: [parentCanvas currentTag]
