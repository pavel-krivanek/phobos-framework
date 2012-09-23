as yet unclassified
renderButtonsStatesOn: xul

	| currentState  |
	
	xul groupbox flex: 1; with: [
		xul caption label: 'states'.
		xul vbox with: [
			xul description value: 'These show states.'.
			xul checkbox flex: 1; label: 'Default'; default: true;
				oncommand: [currentState set: #value to: 'Default'].
			xul checkbox flex: 1; label: 'Checked'; checked: true;
				oncommand: [currentState set: #value to: 'Checked'].
			xul checkbox flex: 1; label: 'Normal';  
				oncommand: [currentState set: #value to: 'Normal'].
			xul checkbox flex: 1; label: 'Disabled'; disabled: true;
				oncommand: [currentState set: #value to: 'Disabled'].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].	
	].