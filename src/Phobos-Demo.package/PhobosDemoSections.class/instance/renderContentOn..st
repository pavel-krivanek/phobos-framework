as yet unclassified
renderContentOn: xul

	|  section |
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'Sections'.].
			
			section := xul section: [
				xul groupbox with: [
					xul caption label: 'This is a section'.
					xul description value: 'Reresh button clicks:'.
					list ifEmpty: [xul description value: '(none)'].
					list do: [:each |
						xul description value: each].
]].
			xul button label: 'Refresh'; oncommand: [
				list add: DateAndTime now asString.
				section refresh].].

