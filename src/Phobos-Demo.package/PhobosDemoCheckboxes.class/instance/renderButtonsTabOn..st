as yet unclassified
renderButtonsTabOn: xul

	| currentState  |

	xul groupbox flex: 1; with: [
		xul caption label: 'tabbing'.
		xul vbox with: [
			xul description value: 'These tab oddly'.
			xul checkbox flex: 1; label: 6; tabindex: 6; oncommand: [currentState set: #value to: 6].
			xul checkbox flex: 1; label: 5; tabindex: 5; oncommand: [currentState set: #value to: 5].
			xul checkbox flex: 1; label: 4; tabindex: 4; oncommand: [currentState set: #value to: 4].
			xul checkbox flex: 1; label: 3; tabindex: 3; oncommand: [currentState set: #value to: 3].
			xul checkbox flex: 1; label: 2; tabindex: 2; oncommand: [currentState set: #value to: 2].
			xul checkbox flex: 1; label: 1; tabindex: 1; oncommand: [currentState set: #value to: 1].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].
			].