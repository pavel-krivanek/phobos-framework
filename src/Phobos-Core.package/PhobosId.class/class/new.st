as yet unclassified
new

	lastId ifNil: [lastId := 1].
	lastId := lastId + 1.
	^ 'XULID_', lastId asString.