as yet unclassified
buttonFor: aCommand
	
	| button |

	button := OBPhobosPluggableButtonSection new
		model: aCommand;
		getStateSelector: #isActive;
		actionSelector: (aCommand isActive ifTrue: [#execute] ifFalse: [#yourself]);
		getLabelSelector: #buttonLabel.
	
	^ button