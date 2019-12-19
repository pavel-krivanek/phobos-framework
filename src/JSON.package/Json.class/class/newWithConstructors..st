as yet unclassified
newWithConstructors: aCollection
	| m |
	m := Dictionary new.
	aCollection do: [:each |
		(each isKindOf: Association)
			ifTrue: [m add: each]
			ifFalse: [m at: each name asString put: each]].
	^ self new ctorMap: m; yourself.