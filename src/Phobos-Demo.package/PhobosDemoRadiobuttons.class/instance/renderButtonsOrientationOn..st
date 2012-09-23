as yet unclassified
renderButtonsOrientationOn: xul

	| currentState  |

	xul groupbox flex: 1; with: [
		xul caption label: 'orientation'.
		xul radiogroup flex: 1; with: [
			xul description value: 'These show different orientation.'.
				xul radio label: 'Left';
					oncommand: [currentState set: #value to: 'A radiobutton to the left of the label']. 
				xul radio label: 'Right'; dir: 'reverse';
					oncommand: [currentState set: #value to: 'A radiobutton to the left of the label']. 
				xul radio label: 'Above'; orient: 'vertical'; dir: 'forward';
					oncommand: [currentState set: #value to: 'A radiobutton above the label'].
				xul radio label: 'Below'; orient: 'vertical'; dir: 'reverse';
					oncommand: [currentState set: #value to: 'A radiobutton below the label'].
				xul radio oncommand: [currentState set: #value to: 'A radiobutton with no label'].
				xul radio oncommand: [currentState set: #value to: 'Another radiobutton with no label'].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].
	].