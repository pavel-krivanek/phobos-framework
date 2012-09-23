as yet unclassified
renderButtonsStatesOn: xul

	| currentState  |
	
	xul groupbox with: [
		xul caption label: 'These buttons have different button states'.
		xul hbox with: [
			xul button flex: 1; label: 'Default'; default: true;
				oncommand: [currentState set: #value to: 'Default'].
			xul button flex: 1; label: 'Checked'; checked: true;
				oncommand: [currentState set: #value to: 'Checked'].
			xul button flex: 1; label: 'Normal';  
				oncommand: [currentState set: #value to:  'Normal'].
			xul button flex: 1; label: 'Disabled'; disabled: true;
				oncommand: [currentState set: #value to: 'Disabled'].
			].
		xul hbox pack: 'center'; with: [
			currentState := xul description 
				value: '(no input yet)';
				yourself]].