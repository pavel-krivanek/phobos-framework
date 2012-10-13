as yet unclassified
new

	LastId ifNil: [LastId := 1].
	LastId := LastId + 1.
	^ 'XULID_SERVER_', LastId asString.