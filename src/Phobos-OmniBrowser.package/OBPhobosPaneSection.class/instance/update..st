as yet unclassified
update: aSelector 
	aSelector = #switch ifFalse: [^ self].
	self hasButton = model wantsButton ifTrue: [^ self].
	model wantsButton
		ifTrue: [ button := self buttonFor: model switch. self refresh ]
		ifFalse: [ button := nil. self refresh ]