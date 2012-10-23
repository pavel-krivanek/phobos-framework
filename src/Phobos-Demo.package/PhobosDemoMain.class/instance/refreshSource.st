as yet unclassified
refreshSource

	| src |	
	src := String streamContents: [:s | child class fileOutOn: s ].	
	source setContent: src.
	