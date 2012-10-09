as yet unclassified
component	^ self owner isDecoration		ifTrue: [self owner component]		ifFalse: [self owner]