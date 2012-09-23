as yet unclassified
renderDirectionOn: xul

		xul groupbox with: [
			xul caption label: 'direction'.
			xul hbox dir: 'forward'; with: [
				xul button label: 'Here'.
				xul button label: 'the'.
				xul button label: 'direction'.
				xul button label: 'is'.
				xul button label: 'forward'.].
			xul hbox dir: 'reverse'; with: [
				xul button label: 'Here'.
				xul button label: 'the'.
				xul button label: 'direction'.
				xul button label: 'is'.
				xul button label: 'reverse'.].
			xul hbox with: [
				xul button label: 'Here the'; ordinal: 4.
				xul button label: 'ordinal'; ordinal: 1.
				xul button label: 'attribute'; ordinal: 3.
				xul button label: 'sets the order.'; ordinal: 2.]
		].