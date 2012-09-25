as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'XUL Images'.]."
	  xul hbox with: [

		xul groupbox with: [
			xul caption label: 'Embedded SVG image'.	
			xul rawXml: self svgImage ].	
		
	   xul vbox with: [	
		xul groupbox with: [
			xul caption label: 'JPG image'.
			xul hbox with: [
				xul vbox align: 'center'; with: [
					xul image style: 'width: 62px; height: 79px'; src: self image1Url.
					xul label value: 'smaller image'.].
				xul vbox align: 'center'; with: [
					xul image src: self image1Url.
					xul label value: 'natural-sized image'.].
			].
		].
	
		xul groupbox flex: 1; with: [
			xul caption label: 'An icon in PNG'.
			xul hbox with: [
				xul vbox align: 'center'; with: [
					xul image style: 'width: 16px; height: 16px'; src: self image2Url.
					xul label value: 'smaller image'.].
				xul vbox align: 'center'; with: [
					xul image src: self image2Url.
					xul label value: 'natural-sized image'.].
]
			]]	
		].
	].
	