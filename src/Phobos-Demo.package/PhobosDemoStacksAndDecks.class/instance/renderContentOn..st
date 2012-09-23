as yet unclassified
renderContentOn: xul

	| deck |

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'XUL Stacks and Decks'.]."
			
		xul hbox with: [
			xul groupbox with: [
				xul caption label: 'stack'.
				xul stack with: [
					xul image src: self image2Url.
					xul image src: self image1Url. 
					xul label value: 'Phobos'; style: 'font-weight:bold'; top: '40px'.
					xul button image: self image2Url; left: '30px'; top: '95px'.]].
			
		xul groupbox with: [
				xul caption label: 'deck'.
				deck := xul deck with: [
					xul image src: self image2Url.
					xul image src: self image1Url. 
					xul label value: 'Phobos'; style: 'font-weight:bold'; top: '40px'.
					xul button image: self image2Url; left: '30px'; top: '95px'.];
					yourself.
				xul radiogroup flex: 1; orient: 'horizontal'; with: [
					xul radio label: '0'; oncommand: [deck setAttribute: #selectedIndex to: 0].
					xul radio label: '1'; oncommand: [deck setAttribute: #selectedIndex to: 1].
					xul radio label: '2'; oncommand: [deck setAttribute: #selectedIndex to: 2].
					xul radio label: '3'; oncommand: [deck setAttribute: #selectedIndex to: 3].
					]]
			].
	]