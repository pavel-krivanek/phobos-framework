as yet unclassified
renderMultipleSelectOn: xul

	| multipleState multipleList | 

		xul groupbox flex: 1; with: [
			xul caption label: 'with multiple selection'.
			multipleList := xul listbox rows: 5; seltype: #multiple; onselect: [multipleState set: #value to: (multipleList get: 'selectedCount')]; with: [
				xul listitem label: 'Pearl'.
				xul listitem label: 'Aramis'.
				xul listitem label: 'Yakima'.
				xul listitem label: 'Tribble'.
				xul listitem label: 'Cosmo'.];
				yourself.
			xul hbox align: 'center'; with: [
				xul button label: 'Select All'; oncommand: [multipleList onElement: '.selectAll()'].
				xul button label: 'Clear All'; oncommand: [multipleList onElement: '.selectItem(-1)'].
				xul spacer flex: 1].			
		xul hbox pack: 'center'; with: [
			multipleState := xul description 
				value: '(no input yet)';
				yourself]].	