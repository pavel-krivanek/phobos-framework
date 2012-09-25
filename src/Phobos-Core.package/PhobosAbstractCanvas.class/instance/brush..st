accessing
brush: aTag

	| target |
	target := self targetCanvas.
	aTag parentTag: currentTag.
	aTag canvas: target.
	aTag parentTag
		ifNil: [target addTag: aTag]
		ifNotNil: [aTag parentTag children add: aTag].
	
	^ aTag