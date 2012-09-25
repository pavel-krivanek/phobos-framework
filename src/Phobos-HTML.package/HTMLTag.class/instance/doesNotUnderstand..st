as yet unclassified
doesNotUnderstand: aMessage

	| key arg |
	
	key := aMessage selector.
	(key isKeyword and: [(key occurrencesOf: $:) = 1])
		ifTrue: [
			key := key allButLast asSymbol.
			arg := aMessage arguments first.
			self attributesAt: key put: arg.
			^ arg].
	^ super doesNotUnderstand: aMessage
				
	