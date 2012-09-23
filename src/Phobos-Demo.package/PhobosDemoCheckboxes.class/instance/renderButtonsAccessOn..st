as yet unclassified
renderButtonsAccessOn: xul

	| currentState  |

	xul groupbox flex: 1; with: [
		xul caption label: 'accesskeys'.
		xul vbox with: [
			xul description value: 'These have access keys.'.
			xul checkbox flex: 1; label: 'Animal'; accesskey: 'A'; 
				oncommand: [currentState set: #value to: 'Animal'].
			xul checkbox flex: 1; label: 'Bear'; accesskey: 'B'; 
				oncommand: [currentState set: #value to: 'Bear'].
			xul checkbox flex: 1; label: 'Cat'; accesskey: 'C'; 
				oncommand: [currentState set: #value to: 'Cat'].
			xul checkbox flex: 1; label: 'Dog'; accesskey: 'D'; 
				oncommand: [currentState set: #value to: 'Dog'].
			xul checkbox flex: 1; label: 'Deer'; accesskey: 'E'; 
				oncommand: [currentState set: #value to: 'Deer'].
			xul checkbox flex: 1; label: 'Fish'; accesskey: 'F'; 
				oncommand: [currentState set: #value to: 'Fish'].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].
	].