as yet unclassified
renderFunctioningGroupOn: xul

	| box img1 img2 img3 |
	
	xul groupbox flex: 1; with: [
		xul caption label: 'functioning tool and menu bars'.
		xul toolbox with: [
			xul toolbar with: [
				xul toolbarbutton label: 'Color:'.
				#(red yellow green cyan blue magenta) do: [:color |
					xul toolbarbutton type: 'radio'; name: 'color'; 
						image: 'http://www.hevanet.com/acorbin/xul/images/', color, '_apple.png'; 
						oncommand: [box set: 'style.background' to: color]].
				]].

		xul menubar with: [
			xul menu label: 'Color'; accesskey: 'o'; with: [
				xul menupopup with: [
					#(red yellow green cyan blue magenta) do: [:color |
						xul menuitem type: 'radio'; name: 'color2'; label: color capitalized; 
							image: 'http://www.hevanet.com/acorbin/xul/images/', color, '_apple.png'; 
							oncommand: [box set: 'style.background' to: color]].
					
				]].
			xul menu label: 'Image'; accesskey: 'i'; with: [
				xul menupopup with: [
					xul menuitem type: 'checkbox'; label: 'Image 1'; checked: true;
						oncommand: [
							drawImage1 := drawImage1 not. 
							img1 set: 'hidden' to: drawImage1 not].
					xul menuitem type: 'checkbox'; label: 'Image 2'; checked: true;
						oncommand: [
							drawImage2 := drawImage2 not. 
							img2 set: 'hidden' to: drawImage2 not].
					xul menuitem type: 'checkbox'; label: 'Image 3'; checked: true;
						oncommand: [
							drawImage3 := drawImage3 not. 
							img3 set: 'hidden' to: drawImage3 not].
				]].
		].
					
		box := xul vbox align: 'center'; style: '';  flex: 1; with: [
			xul spacer flex: 1.
			img1 := xul image src: self image1Url; yourself.
			xul spacer flex: 1.	
			img2 := xul image src: self image2Url; yourself.
			xul spacer flex: 1.
			img3 := xul image src: self image3Url; yourself.
		]; yourself.
	]