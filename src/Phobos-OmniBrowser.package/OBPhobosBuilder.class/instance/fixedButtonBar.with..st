as yet unclassified
fixedButtonBar: aPanel with: aBlock 

	| section |
	section := OBPhobosButtonBarSection new model: aPanel.
	current addSection: section.
	^self current: section do: aBlock