as yet unclassified
on: selector of: anObject values: anArray text: aBlock
	
	| selection closureId |
	
	selection := (anObject perform: selector).
	
	closureId := self canvas component registerClosure: [:selectedIndexes | 
		| result |
		result := selectedIndexes collect: [:index | anArray at: index asNumber].
		anObject perform: selector asMutator with: result ].
	self attributesAt: 'phobos:callback' put: closureId.

	self with: [
		anArray withIndexDo: [:val :index |
			self canvas listitem 
				label: (aBlock value: val);
				attributesAt: 'phobos:value' put: index asString;
				selected: (selection includes: val)]]