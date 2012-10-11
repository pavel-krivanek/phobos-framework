as yet unclassified
textarea: aDefinitionPanel with: aBlock 

	| section |
	section := OBPhobosPluggableTextSection new model: aDefinitionPanel.
	section getTextSelector: #text.
	section setTextSelector:#accept:notifying:.
	
	current addSection: section.
	^self current: section do: aBlock