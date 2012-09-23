as yet unclassified
renderSourceOn: xml

	| src |
"
	src := String streamContents: [:s | child class fileOutOn: s ].
	
	xml vBox flex: 1; style: 'overflow: auto'; with: [ 
		xml html: '<pre>'.
		xml text: src. 
		xml html: '</pre>'."