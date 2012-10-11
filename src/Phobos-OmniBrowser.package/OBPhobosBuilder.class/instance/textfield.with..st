as yet unclassified
textfield: aMercuryPanel with: aBlock 

	| section |
	section := OBPhobosTextFieldSection new model: aMercuryPanel.
	section getTextSelector: #text.
	section setTextSelector:#accept:notifying:.
	
	current addSection: section.
	^self current: section do: aBlock