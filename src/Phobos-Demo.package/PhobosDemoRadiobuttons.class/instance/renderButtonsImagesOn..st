as yet unclassified
renderButtonsImagesOn: xul

	| currentState  |

	xul groupbox flex: 1; with: [
		xul caption label: 'images'.
		xul radiogroup flex: 1; with: [
			xul description value: 'These radiobuttons show images'.
			xul radio label: 'Left'; src: self imageUrl;
				oncommand: [currentState set: #value to: 'A radiobutton to the left of the label'].
			xul radio label: 'Right'; src: self imageUrl; dir: 'reverse';
				oncommand: [currentState set: #value to: 'A radiobutton to the right of the label'].
			xul radio label: 'Above'; src: self imageUrl; orient: 'vertical'; dir: 'forward';
				oncommand: [currentState set: #value to: 'A radiobutton above the label'].
			xul radio label: 'Below'; src: self imageUrl; orient: 'vertical'; dir: 'reverse';
				oncommand: [currentState set: #value to: 'A radiobutton below the label'].
			xul radio src: self imageUrl; 
				oncommand: [currentState set: #value to: 'A radiobutton with no label'].
			xul radio src: self imageUrl; 
				oncommand: [currentState set: #value to: 'Another radiobutton with no label'].
			xul separator flex: 1.
			xul hbox pack: 'center'; with: [
				currentState := xul description 
					value: '(no input yet)';
					yourself]].
	].