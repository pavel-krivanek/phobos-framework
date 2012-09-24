as yet unclassified
brush: aTag

	aTag parentTag: currentTag.
	aTag canvas: self.
	aTag parentTag
		ifNil: [nodes add: aTag]
		ifNotNil: [aTag parentTag children add: aTag].
	
	^ aTag