as yet unclassified
renderButtonsAccessOn: xul

	| currentState  |

	xul groupbox flex: 1; with: [
		xul caption label: 'accesskeys'.
		xul radiogroup flex: 1; with: [
			xul description value: 'These have access keys.'.
			xul radio label: 'Animal'; accesskey: 'A'; 
				oncommand: [currentState set: #value to: 'Animal'].
			xul radio label: 'Bear'; accesskey: 'B'; 
				oncommand: [currentState set: #value to: 'Bear'].
			xul radio label: 'Cat'; accesskey: 'C'; 
				oncommand: [currentState set: #value to: 'Cat'].
			xul radio label: 'Dog'; accesskey: 'D'; 
				oncommand: [currentState set: #value to: 'Dog'].
			xul radio label: 'Deer'; accesskey: 'E'; 
				oncommand: [currentState set: #value to: 'Deer'].
			xul radio label: 'Fish'; accesskey: 'F'; 
				oncommand: [currentState set: #value to: 'Fish'].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].
	].