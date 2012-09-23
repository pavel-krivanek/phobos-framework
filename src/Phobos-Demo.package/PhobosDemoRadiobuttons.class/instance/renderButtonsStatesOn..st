as yet unclassified
renderButtonsStatesOn: xul

	| currentState  |

	xul groupbox flex: 1; with: [
		xul caption label: 'states'.
		xul radiogroup flex: 1; with: [
			xul description value: 'These show different states.'.
			xul radio  label: 'Selected'; selected: true;
				oncommand: [currentState set: #value to: 'Checked'].
			xul radio label: 'Normal';  
				oncommand: [currentState set: #value to: 'Normal'].
			xul radio label: 'Disabled'; disabled: true;
				oncommand: [currentState set: #value to: 'Disabled'].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].
	].