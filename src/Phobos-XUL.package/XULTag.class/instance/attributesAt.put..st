as yet unclassified
attributesAt: aKey put: aValue

	| val |
	
	val := aValue isBlock 
		ifTrue: [
			| closureId |
			closureId := self canvas component registerClosure: aValue.
			'runClosure("', closureId, '")'.]
		ifFalse: [aValue].

	^ self attributes add: (aKey -> val)