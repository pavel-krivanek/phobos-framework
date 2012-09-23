as yet unclassified
renderContentOn: xul

	self renderPopupsOn: xul.

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'XUL Popups'.]."
			
		xul hbox with: [
			xul groupbox flex: 1; orient: 'horizontal'; with: [
				xul caption label: 'menulists'.
	
				xul groupbox flex: 1; with: [
					xul caption label: 'states'.
					xul menulist label: 'Selected'; with: [
						xul menupopup with: [
							xul menuitem label: 'Normal'.
							xul menuitem label: 'Selected'; selected: true.
							xul menuitem label: 'Disabled'; disabled: true.
							xul menuitem label: 'Checked'; type: 'checkbox'.
							xul menuitem label: 'Checked'; type: 'checkbox'; checked: true. ]]].

				xul groupbox flex: 1; with: [
					xul caption label: 'non-editable'.
					xul menulist label: 'Pearl'; with: [
						xul menupopup with: [
							xul menuitem label: 'Pearl'; selected: true.
							xul menuitem label: 'Aramis'.
							xul menuitem label: 'Yakima'.
							xul menuitem label: 'Tribble'.
							xul menuitem label: 'Cosmo'. ]]].

				xul groupbox flex: 1; with: [
					xul caption label: 'editable'.
					xul menulist label: 'Gray'; editable: true; with: [
						xul menupopup with: [
							xul menuitem label: 'Gray'; selected: true.
							xul menuitem label: 'Black'.
							xul menuitem label: 'Holstein'.
							xul menuitem label: 'Orange'.
							xul menuitem label: 'White'. ]]].
				 ]
			].
		
		xul groupbox with: [
			xul caption label: 'positions for popups'.
			xul grid with: [
				xul columns with: [
					xul column flex: 1.
					xul column flex: 1.
					xul column flex: 1.
					xul column flex: 1.].
				xul rows with: [
					xul row with: [
						xul button label: 'Start Before'; popup: 'start_before'.
						xul button label: 'Before Start"'; popup: 'before_start'.
						xul button label: 'Before End'; popup: 'before_end'.
						xul button label: 'End Before'; popup: 'end_before'.].
					xul row with: [
						xul button label: 'Start After'; popup: 'start_after'.
						xul button label: 'After Start'; popup: 'after_start'.
						xul button label: 'After End'; popup: 'after_end'.
						xul button label: 'End After'; popup: 'end_after'.].
					xul row with: [
						xul button label: 'Overlap'; popup: 'overlap'.
						xul button label: 'At Pointer'; popup: 'at_pointer'.
						xul button label: 'After Pointer'; popup: 'after_pointer'.].
		]]]
	]
