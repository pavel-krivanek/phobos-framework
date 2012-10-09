as yet unclassified
on: selector of: anObject values: anArray text: aBlock
	
	| selection closureId |
	
	selection := (anObject perform: selector).
	
	closureId := self canvas component registerClosure: [:selectedIndex | 
		| result |
		result := anArray at: selectedIndex asNumber.
		anObject perform: selector asMutator with: result ].
	self attributesAt: 'phobos:callback' put: closureId.
	self attributesAt: 'phobos:formitem' put: #true.

	self with: [
		anArray withIndexDo: [:val :index |
			self canvas radio 
				label: (aBlock value: val);
				attributesAt: 'phobos:value' put: index asString;
				selected: (selection = val)]]