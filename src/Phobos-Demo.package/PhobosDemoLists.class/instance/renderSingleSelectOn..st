as yet unclassified
renderSingleSelectOn: xul

	| singleState singleList | 

		xul groupbox flex: 1; with: [
			xul caption label: 'with single selection'.
			singleList := xul listbox rows: 5; onselect: [singleState set: #value to: (singleList onElement: '.getSelectedItem(0).getAttribute("label")')]; with: [
				xul listitem label: 'Pearl'.
				xul listitem label: 'Aramis'.
				xul listitem label: 'Yakima'.
				xul listitem label: 'Tribble'.
				xul listitem label: 'Cosmo'.];
			yourself.
		xul hbox pack: 'center'; with: [
			singleState := xul description 
				value: '(no input yet)';
				yourself]].