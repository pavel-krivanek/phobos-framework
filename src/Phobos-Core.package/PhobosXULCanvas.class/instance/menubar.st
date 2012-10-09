as yet unclassified
menubar

	^ (self component session platform beginsWith: 'MacIntel')
		ifTrue: [ self brush: XULToolbarTag new]
		ifFalse: [ self brush: XULMenubarTag new]

	