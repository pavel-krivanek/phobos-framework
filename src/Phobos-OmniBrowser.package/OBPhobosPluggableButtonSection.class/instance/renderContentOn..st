as yet unclassified
renderContentOn: xul

	xul toolbarbutton 
		flex: 1; 
		label: (model perform: self getLabelSelector);
		disabled: (model perform: self getStateSelector) not;
		oncommand: [model perform: actionSelector].
		