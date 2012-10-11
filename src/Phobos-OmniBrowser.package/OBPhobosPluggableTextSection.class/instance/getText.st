as yet unclassified
getText

	^ ((model perform: getTextSelector) ifNil: [String new]) asString shallowCopy.
	