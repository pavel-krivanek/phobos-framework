accessing
rawXml: anObject 
	
	| node |
	
	node := XULRawXMLNode new.
	node value: anObject.
	^ self brush: node.