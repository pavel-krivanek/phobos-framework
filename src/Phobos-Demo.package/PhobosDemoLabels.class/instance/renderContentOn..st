as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Labels'.].
			
		xul groupbox with: [
			xul description with: [ xul text: 'This is a multi-line description. 
     It should wrap if there isn''t enough room to put it in one line.
     Let''s put in another sentence for good measure.' ].
			xul description disabled: true; with: [ xul text: 'This description would be portrayed as disabled if it were possible to disable a description.' ]].
		
		xul groupbox with: [
			xul label with: [ xul text: 'This is a multi-line label. 
     It should wrap if there isn''t enough room to put it in one line.
     Let''s put in another sentence for good measure.' ].
			xul label disabled: true; with: [ xul text: 'This label should be portrayed as disabled.' ]].
	]