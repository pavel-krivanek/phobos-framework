as yet unclassified
on: selector of: anObject

	| val closureId |
	
	closureId := self canvas component registerClosure: [ :value | anObject perform: selector asMutator with: (self toSmalltalk: value) ].

	self attributesAt: 'phobos:callback' put: closureId.
	self color: (self toJavaScript: (anObject perform: selector)).
	
	^ anObject