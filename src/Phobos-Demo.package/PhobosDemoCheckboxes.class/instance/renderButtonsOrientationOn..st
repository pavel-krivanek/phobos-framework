as yet unclassified
renderButtonsOrientationOn: xul

	| currentState  |
	
	xul groupbox flex: 1; with: [
		xul caption label: 'orientation'.
		xul vbox with: [
			xul description value: 'These show different orientation.'.
				xul checkbox label: 'Left';
					oncommand: [currentState set: #value to: 'A checkbox to the left of the label'].
				xul checkbox label: 'Right'; dir: 'reverse';
					oncommand: [currentState set: #value to: 'A checkbox to the left of the label'].
				xul checkbox label: 'Above'; orient: 'vertical'; dir: 'forward';
					oncommand: [currentState set: #value to: 'A checkbox above the label'].
				xul checkbox label: 'Below'; orient: 'vertical'; dir: 'reverse';
					oncommand: [currentState set: #value to: 'A checkbox below the label'].
				xul checkbox oncommand: [currentState set: #value to: 'A checkbox with no label'].
				xul checkbox oncommand: [currentState set: #value to: 'Another checkbox with no label'].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].
	].