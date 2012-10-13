as yet unclassified
renderSourceOn: xul

	| src html |	
	src := String streamContents: [:s | child class fileOutOn: s ].		
	xul vbox flex: 1; style: 'overflow: auto'; with: [
		html := xul HTML.
		html pre style: 'background-color: white'; with: [		
			html text: (src  copyReplaceAll: String cr with: String lf)]]