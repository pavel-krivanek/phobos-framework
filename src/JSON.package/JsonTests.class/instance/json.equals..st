as yet unclassified
json: aString equals: aValue
	| readValue |
	readValue := self readFrom: aString.
	self assert: readValue = aValue.