as yet unclassified
renderInstanceVariables: aCollection of: anObject on: aStream
	| map |
	map := Dictionary new.
	aCollection do: [:ivarName | map at: ivarName put: (anObject instVarNamed: ivarName)].
	self render: map withConstructor: anObject class name asString on: aStream