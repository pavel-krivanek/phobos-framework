as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'XUL Toolbars, Menubars and Statusbars'.]."
			
		xul groupbox with: [
			xul caption label: 'non-functioning tool and menu bars'.
			
			xul toolbar with: [
				xul label value: 'This is a toolbar:'.
				xul toolbarseparator.
				xul toolbarbutton label: 'Button'; accesskey: 'B'; oncommand: 'alert("Ouch!!")'.
				xul toolbarbutton label: 'Check'; type: 'checkbox'.
				xul toolbarbutton label: 'Disabled'; disabled: true.
				xul toolbarbutton label: 'Image'; image: self image1Url.].
			xul toolbar with: [
				xul label value: 'This is another toolbar:'.
				xul toolbarseparator.
				xul toolbarbutton label: 'Radio1'; type: 'radio'; name: 'radio'.
				xul toolbarbutton label: 'Radio2'; type: 'radio'; name: 'radio'.
				xul toolbarbutton label: 'Radio3'; type: 'radio'; name: 'radio'.].
			xul menubar with: [
				xul label value: 'This is a menubar'.
				xul toolbarseparator.
				xul menu label: 'Radio'; accesskey: 'R'; with: [
					xul menupopup with: [
						xul menuitem type: 'radio'; name: 'radio'; label: 'Radio1'.
						xul menuitem type: 'radio'; name: 'radio'; label: 'Radio2'.
						xul menuitem type: 'radio'; name: 'radio'; label: 'Radio3'.]].
				xul menu label: 'Checkbox'; accesskey: 'C'; with: [
					xul menupopup with: [
						xul menuitem type: 'checkbox'; label: 'Check1'.
						xul menuitem type: 'checkbox'; label: 'Check2'.
						xul menuitem type: 'checkbox'; label: 'Check3'.]].
				xul menu label: 'Cascading'; accesskey: 'a'; with: [
					xul menupopup with: [
						xul menu label: 'More'; with: [
							xul menupopup with: [
								xul menuitem label: 'A'.
								xul menuitem label: 'B'.
								xul menuitem label: 'C'.
								xul menuseparator.
								xul menu label: 'More'; with: [
									xul menupopup with: [
										xul menuitem label: '1'.
										xul menuitem label: '2'.
										xul menuitem label: '3'.]]]].
						xul menuseparator.
						xul menuitem label: 'X'.
						xul menuitem label: 'Y'.
						xul menuitem label: 'Z'.]].
				xul menu label: 'Images'; accesskey: 'I'; with: [
					xul menupopup with: [
						xul menuitem label: 'Left'; class:'menuitem-iconic'; src: self image1Url.
						xul menuitem label: 'Right'; dir: 'reverse'; class: 'menuitem-iconic'; src: self image1Url.
						xul menuitem label: 'None']].
				xul spacer flex: 1.
				xul menu label: 'Help'; accesskey: 'H'; with: [
					xul menupopup with: [
						xul menuitem label: 'This is help']]]	].

		self renderFunctioningGroupOn: xul.
		
		xul statusbar with: [
			xul statusbarpanel label: 'This is a statusbarpanel.'.
			xul statusbarpanel label: 'As is this.'.
			xul statusbarpanel label: 'And also this...'; flex: 1.
			xul statusbarpanel label: 'Click Me!!'; onclick: 'alert("Ouch")'.]
	]
