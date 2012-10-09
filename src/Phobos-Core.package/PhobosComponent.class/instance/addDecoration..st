accessing
addDecoration: newDecoration
	
	| prev dec |	
		
	prev := nil.	
	dec := self decoration.	
	[dec ~~ self and: [self decoration: dec shouldWrap: newDecoration]] 
		whileTrue: [prev := dec. dec := dec owner].	
	
	newDecoration owner: dec.	
	prev ifNil: [self decoration: newDecoration]		
		ifNotNil: [prev owner: newDecoration].	
			
	^ newDecoration