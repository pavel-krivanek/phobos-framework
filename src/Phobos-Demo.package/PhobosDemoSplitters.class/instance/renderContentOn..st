as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Splitters'.].
		
		xul groupbox orient: 'horizontal'; flex: 1; with: [
			xul caption label: 'collapse before'.
			xul groupbox flex: 1; with: [
				xul label flex: 1; value: 'Left side'].
			xul splitter collapse: 'before'; with: [ xul grippy. ].
			xul groupbox flex: 1; with: [
				xul label flex: 1; value: 'Right side']].

		xul groupbox orient: 'horizontal'; flex: 1; with: [
			xul caption label: 'collapse after'.
			xul groupbox flex: 1; with: [
				xul label flex: 1; value: 'Left side'].
			xul splitter collapse: 'after'; with: [ xul grippy. ].
			xul groupbox flex: 1; with: [
				xul label flex: 1; value: 'Right side']].
	
		xul groupbox orient: 'horizontal'; flex: 1; with: [
			xul caption label: 'no collapse'.
			xul groupbox flex: 1; with: [
				xul label flex: 1; value: 'Left side'].
			xul splitter collapse: 'none'; with: [ xul grippy. ].
			xul groupbox flex: 1; with: [
				xul label flex: 1; value: 'Right side']].
		
		xul groupbox orient: 'horizontal'; flex: 1; with: [
			xul caption label: 'resize the closest widgets on both sides'.
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Left most side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Middle Left side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Closest Left side']].
			xul splitter collapse: 'none'; resizebefore: 'closest'; resizeafter: 'closest'.
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Closest Right side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Middle Right side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Right most side']].
		].
				
		xul groupbox orient: 'horizontal'; flex: 1; with: [
			xul caption label: 'resize the farthest widgets on both sides'.
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Left most side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Middle Left side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Closest Left side']].
			xul splitter collapse: 'none'; resizebefore: 'farthest'; resizeafter: 'farthest'.
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Closest Right side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Middle Right side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Right most side']].
		].

		xul groupbox orient: 'horizontal'; flex: 1; with: [
			xul caption label: 'grow the widgets on the right side'.
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Left side']].
			xul splitter collapse: 'none'; resizebefore: 'grow'; resizeafter: 'grow'.
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Closest Right side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Middle Right side']].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Right most side']].
		].

		xul groupbox orient: 'horizontal'; flex: 1; with: [
			xul caption label: 'double splitters'.
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Left side']].
			xul splitter collapse: 'before'; with: [ xul grippy. ].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Middle']].
			xul splitter collapse: 'after'; with: [ xul grippy. ].
			xul groupbox flex: 1; with: [ xul description with: [ xul text: 'Right side']].
		].
				
	]