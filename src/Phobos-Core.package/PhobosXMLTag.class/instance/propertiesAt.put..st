as yet unclassified
propertiesAt: aKey put: aValue

	| val |
	
	val := aValue isBlock 
		ifTrue: [
			| closureId |
			closureId := self canvas component registerClosure: aValue.
			'phobos.runClosure("', closureId, '")'.]
		ifFalse: [aValue].

	^ self properties add: (aKey -> val)