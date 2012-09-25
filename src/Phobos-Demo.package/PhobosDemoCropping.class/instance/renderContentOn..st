as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Cropping'.].
			
		xul groupbox with: [
			xul caption label: 'start'.
			
			xul description crop: 'start'; value: 'This is a one-line description. 
It will be cropped on the left if there isn''t enough room for it.'.

			xul description crop: 'start'; value: 'Now is the time for all good men to come to the aid of their party.  Mary had a little lamb whose fleece was white as snow.'.

			xul description crop: 'start'; value: 'This is a one-line label. 
It will be cropped on the left if there isn''t enough room for it.'.
		].
	
		xul groupbox with: [
			xul caption label: 'end'.
			
			xul description crop: 'end'; value: 'While this one-line description 
will be cropped on the right if there isn''t enough room for it.'.

			xul description crop: 'end'; value: 'Now is the time for all good men to come to the aid of their party.  Mary had a little lamb whose fleece was white as snow.'.

			xul description crop: 'end'; value: 'While this one-line label 
will be cropped on the right if there isn''t enough room for it.'.
		].

		xul groupbox with: [
			xul caption label: 'center'.
			
			xul description crop: 'center'; value: 'nd this one-line description, 
if there isn''t enough room for it,  will be cropped in the middle.'.

			xul description crop: 'center'; value: 'Now is the time for all good men to come to the aid of their party.  Mary had a little lamb whose fleece was white as snow.'.

			xul description crop: 'center'; value: 'And this one-line label, 
if there isn''t enough room for it,  will be cropped in the middle.'.
		].	
	]