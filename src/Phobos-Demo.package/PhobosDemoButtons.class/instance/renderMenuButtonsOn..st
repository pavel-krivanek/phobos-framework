as yet unclassified
renderMenuButtonsOn: xul

	| currentState  |

	xul groupbox flex:1; with: [
		xul caption label: 'These are menubuttons.'.
		xul hbox with: [
			xul button flex: 1; type: 'menu'; label: 'Menu'; with: [
				xul menupopup with: [
					xul menuitem label: 'Option 1'; 
						oncommand: [currentState set: #value to: 'Option 1'].
					xul menuitem label: 'Option 2'; 
						oncommand: [currentState set: #value to: 'Option 2'].
					xul menuitem label: 'Option 3'; 
						oncommand: [currentState set: #value to: 'Option 3'].
					xul menuitem label: 'Option 4'; 
						oncommand: [currentState set: #value to: 'Option 4'].]].
			xul button flex: 1; type: 'menu-button'; label: 'MenuButton'; with: [
				xul menupopup with: [
					xul menuitem label: 'Option A'; 
						oncommand: [currentState set: #value to: 'Option A'].
					xul menuitem label: 'Option B'; 
						oncommand: [currentState set: #value to: 'Option B'].
					xul menuitem label: 'Option C'; 
						oncommand: [currentState set: #value to: 'Option C'].
					xul menuitem label: 'Option D'; 
						oncommand: [currentState set: #value to: 'Option D']]].			
			].
		xul hbox pack: 'center'; with: [
			currentState := xul description 
				value: '(no input yet)';
				yourself]].