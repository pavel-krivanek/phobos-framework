as yet unclassified
renderStatesOn: xul	

		xul groupbox flex: 1; with: [
			xul caption label: 'states'.
			xul listbox rows: 5; with: [
				xul listitem label: 'Normal'.
				xul listitem label: 'Selected'; selected: true.
				xul listitem label: 'Disabled'; disabled: true.
				xul listitem label: 'Checkbox'; type: 'checkbox'.
				xul listitem label: 'Checked'; type: 'checkbox'; checked: true.]].
