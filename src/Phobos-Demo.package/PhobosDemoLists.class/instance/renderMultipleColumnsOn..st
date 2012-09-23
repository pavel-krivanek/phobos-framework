as yet unclassified
renderMultipleColumnsOn: xul

	xul groupbox flex: 1; with: [
		xul caption label: 'with multiple columns and a scrollbar'.
		xul listbox rows: 5; with: [
			xul listcols with: [
				self getHeader do: [:label |
					xul listcol flex: 1.
					xul splitter class: 'tree-splitter'].				].
			xul listhead with: [
				self getHeader do: [:label |
					xul listheader label: label]].
				data do: [:item |
					xul listitem with: [
						xul label value: item name.
						xul label value: item sex.
						xul label value: item color.
						xul label value: item desc.]]]]