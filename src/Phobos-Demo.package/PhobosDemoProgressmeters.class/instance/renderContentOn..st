as yet unclassified
renderContentOn: xul

	| progress |
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Progressmeters'.].
			
		xul hbox with: [
			xul groupbox with: [
				xul caption label: 'determined'.
				progress := xul progressmeter mode: 'determined'; value: 0; yourself.
				xul button label: 'Hit me to advance'; oncommand: [
					progress set: #value to: (progress get: #value) asNumber + 10.
					]].
			xul groupbox with: [
				xul caption label: 'undetermined'.
				xul progressmeter mode: 'undetermined'].]
				
	]