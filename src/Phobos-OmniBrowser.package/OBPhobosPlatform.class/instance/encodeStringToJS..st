as yet unclassified
encodeStringToJS: aString

	| result |
	
	result := aString copyReplaceAll: String cr with: '\n'.
	result := result copyReplaceAll: '"' with: '\"'.
	
	^ result

