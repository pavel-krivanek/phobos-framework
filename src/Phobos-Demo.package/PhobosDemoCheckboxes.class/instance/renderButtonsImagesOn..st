as yet unclassified
renderButtonsImagesOn: xul

	| currentState  |
	
	xul groupbox flex: 1; with: [
		xul caption label: 'images'.
		xul vbox with: [
			xul description value: 'These have images.'.
			xul checkbox label: 'Left'; src: self imageUrl;
				oncommand: [currentState set: #value to: 'A checkbox to the left of the label'].
			xul checkbox label: 'Left'; src: self imageUrl; dir: 'reverse';
				oncommand: [currentState set: #value to: 'A checkbox to the right of the label'].
			xul checkbox label: 'Above'; src: self imageUrl; orient: 'vertical'; dir: 'forward';
				oncommand: [currentState set: #value to: 'A checkbox above the label'].
			xul checkbox label: 'Below'; src: self imageUrl; orient: 'vertical'; dir: 'reverse';
				oncommand: [currentState set: #value to: 'A checkbox below the label'].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].
	].