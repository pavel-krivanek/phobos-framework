as yet unclassified
renderButtonsLabelingOn: xul

	| currentState  |

	xul groupbox with: [
		xul caption label: 'These buttons show different labeling.'.
		xul hbox pack: 'center'; with: [
			xul vbox with: [
				xul button flex: 1; label: 'No Image';
					oncommand: [currentState set: #value to: 'A button with a label only'].
				xul button label: 'Left'; image: self imageUrl;
					oncommand: [currentState set: #value to: 'A button with both an image and a label'].
				xul button label: 'Right'; image: self imageUrl; dir: 'reverse';
					oncommand: [currentState set: #value to: 'A button with the image to the right of the label'].
			
			xul vbox with: [
				xul button label: 'Above'; image: self imageUrl; orient: 'vertical'; dir: 'forward';
					oncommand: [currentState set: #value to: 'A button with the image above the label'].
				xul button label: 'Below'; image: self imageUrl; orient: 'vertical'; dir: 'reverse';
					oncommand: [currentState set: #value to: 'A button with the image below the label'].
	].

			xul vbox with: [
				xul button flex: 1; 
					oncommand: [currentState set: #value to: 'A button with neither image nor label'].
				xul button image: self imageUrl; 
					oncommand: [currentState set: #value to: 'A button with an image only'].
				xul button 
					oncommand: [currentState set: #value to: 'A button with a multi-line, wrapped label'];
					with: [ xul label width: 50; with: 'Wrapped Label'].
	]]].
		xul hbox pack: 'center'; with: [
			currentState := xul description 
				value: '(no input yet)';
				yourself]]