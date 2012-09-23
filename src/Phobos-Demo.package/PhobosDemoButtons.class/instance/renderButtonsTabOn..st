as yet unclassified
renderButtonsTabOn: xul

	| currentState  |
	
	xul groupbox with: [
		xul caption label: 'These buttons tab oddly.'.
		xul hbox with: [
			xul button flex: 1; label: 6; tabindex: 6; oncommand: [currentState set: #value to: 6].
			xul button flex: 1; label: 5; tabindex: 5; oncommand: [currentState set: #value to: 5].
			xul button flex: 1; label: 4; tabindex: 4; oncommand: [currentState set: #value to: 4].
			xul button flex: 1; label: 3; tabindex: 3; oncommand: [currentState set: #value to: 3].
			xul button flex: 1; label: 2; tabindex: 2; oncommand: [currentState set: #value to: 2].
			xul button flex: 1; label: 1; tabindex: 1; oncommand: [currentState set: #value to: 1].
			
			].
		xul hbox pack: 'center'; with: [
			currentState := xul description 
				value: '(no input yet)';
				yourself]].