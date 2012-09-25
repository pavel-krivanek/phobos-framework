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
	xul groupbox with: [
		xul caption label: 'Embedded XHTML'.	
		xul rawXml: '<html xmlns="http://www.w3.org/1999/xhtml"><body><div style="background-image: -moz-linear-gradient(top, #abcdef, #000); padding: 10px; text-align: center; color: white; border: 3px solid black"><h1>Smalltalk</h1><p>DIV with border and gradient</p></div></body></html>' ].	
	].
	