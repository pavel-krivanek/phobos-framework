as yet unclassified
renderContentOn: xml

	xml vbox flex: 1; style: 'overflow: auto'; with: [

		"xml description with: [xml heading: 'XUL Images'.]."
		
		
[		xml groupbox with: [
			xml caption label: 'Embedded SVG image'.
			xml description with: [
					xml html: '<svg:svg width="12px" height="12px">
		   	           <svg:circle r="5" cx="6" cy="6" style="stroke: red; fill: none;"/>
		    	          <svg:line x1="3" y1="9" x2="9" y2="3" style="stroke: red;"/>
		     	       </svg:svg>'.
				xml spacer width: '7px'.
				xml text: 'disallowed'. ]].

		xml groupbox with: [
			xml caption label: 'Embedded animated SVG'.
			xml description with: [
				self renderClockOn: xml. ]].
].				
		xml groupbox with: [
			xml caption label: 'Smalltalk balloon'.
			xml hbox with: [
				xml vbox align: 'center'; with: [
					xml image style: 'width: 62px; height: 79px'; src: self image1Url.
					xml label value: 'smaller image'.].
				xml vbox align: 'center'; with: [
					xml image src: self image1Url.
					xml label value: 'natural-sized image'.].
				xml vbox align: 'center'; with: [
					xml image style: 'width: 246px; height: 316px'; src: self image1Url.
					xml label value: 'enlarged image'.]
			].
		].
		xml groupbox with: [
			xml caption label: 'An icon in PNG'.
			xml hbox with: [
				xml vbox align: 'center'; with: [
					xml image src: self image2Url.
					xml label value: 'natural-sized image'.].
				xml vbox align: 'center'; with: [
					xml image style: 'width: 320px; height: 320px'; src: self image2Url.
					xml label value: 'enlarged image'.]
			]		
		]]