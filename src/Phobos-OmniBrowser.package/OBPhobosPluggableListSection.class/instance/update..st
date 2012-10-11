as yet unclassified
update: aSymbol 
	"Refer to the comment in View|update:."

	aSymbol == getListSelector ifTrue: 
		[ self refresh.
		^ self].
	aSymbol == getIndexSelector ifTrue:
		[^ self " do not refresh "].
