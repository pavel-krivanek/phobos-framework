as yet unclassified
with: aBlock 

	canvas currentTag: self.
	aBlock isString 
		ifTrue: [canvas text: aBlock]
		ifFalse: [aBlock value].
	canvas currentTag: self parentTag.