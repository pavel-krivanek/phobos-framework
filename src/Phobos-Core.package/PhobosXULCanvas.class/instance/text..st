as yet unclassified
text: anObject 
	
	| node |
	
	node := XULTextNode new.
	node value: anObject.
	^ self brush: node.