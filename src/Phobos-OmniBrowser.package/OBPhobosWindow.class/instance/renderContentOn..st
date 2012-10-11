as yet unclassified
renderContentOn: xul

	self subsections size > 0 ifTrue: [
		self subsections allButLastDo: [:section |
			section renderOn: xul.
			xul splitter with: [ xul grippy. ].
			].
		self subsections last renderOn: xul.
		].
	
	xul statusbar with: [
		xul statusbarpanel flex: 1; id: '_JSStatus'; label: 'Ready...'.
		xul statusbarpanel label: 'JavaScript console'; onclick: ('window.open("chrome://global/content/console.xul","_blank","chrome");').
		].