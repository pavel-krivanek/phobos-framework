as yet unclassified
radioButtonBar: aSwitch with: aBlock 

	| section |
	section := OBPhobosRadioButtonBarSection new model: aSwitch.
	section
		getListSelector: #list;
		getSelectionSelector: #selection;
		setSelectionSelector: #selection:.
		
	current ifNotNil: [ current addSection: section ].
	^ section