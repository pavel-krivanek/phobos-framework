as yet unclassified
renderContentOn: xul

	xul hbox flex: 1; with: [
		panes size > 0 ifTrue: [
		panes allButLastDo: [:section |
			section renderOn: xul.
			xul splitter with: [ xul grippy. ].
			].
		panes last renderOn: xul.
		]]
