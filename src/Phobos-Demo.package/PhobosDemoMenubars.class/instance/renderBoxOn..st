as yet unclassified
renderBoxOn: xul

	xul vbox align: 'center'; style: boxStyle;  flex: 1; with: [

		xul spacer flex: 1.
		drawImage1 ifTrue: [xul image src: self image1Url.].
		xul spacer flex: 1.	
		drawImage2 ifTrue: [xul image src: self image2Url.].
		xul spacer flex: 1.
		drawImage3 ifTrue: [xul image src: self image3Url.].
	].