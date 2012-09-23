as yet unclassified
renderHiddenessOn: xul

		xul groupbox with: [
			xul caption label: 'hiddeness'.
			xul hbox with: [
				xul label value: 'Every other button in the line below is hidden'].
			xul hbox with: [
				xul button label: 'Every'.
				xul button label: 'other'; hidden: true.
				xul button label: 'button'.
				xul button label: 'in'; hidden: true.
				xul button label: 'the'.
				xul button label: 'line'; hidden: true.
				xul button label: 'below'.
				xul button label: 'is'; hidden: true.
				xul button label: 'hiden'.
			].
		].