as yet unclassified
renderButtonsAccessOn: xul

	| currentState  |

	xul groupbox with: [
		xul caption label: 'These buttons have access keys.'.
		xul hbox with: [
			xul button flex: 1; label: 'Animal'; accesskey: 'A'; 
				oncommand: [currentState set: #value to: 'Animal'].
			xul button flex: 1; label: 'Bear'; accesskey: 'B'; 
				oncommand: [currentState set: #value to: 'Bear'].
			xul button flex: 1; label: 'Cat'; accesskey: 'C'; 
				oncommand: [currentState set: #value to: 'Cat'].
			xul button flex: 1; label: 'Dog'; accesskey: 'D'; 
				oncommand: [currentState set: #value to: 'Dog'].
			xul button flex: 1; label: 'Deer'; accesskey: 'E'; 
				oncommand: [currentState set: #value to: 'Deer'].
			xul button flex: 1; label: 'Fish'; accesskey: 'F'; 
				oncommand: [currentState set: #value to: 'Fish'].			].
		xul hbox pack: 'center'; with: [
			currentState := xul description 
				value: '(no input yet)';
				yourself]]