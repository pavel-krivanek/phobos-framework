as yet unclassified
render: anObject
	| s |
	s := WriteStream on: String new.
	anObject jsonWriteOn: s.
	^ s contents.