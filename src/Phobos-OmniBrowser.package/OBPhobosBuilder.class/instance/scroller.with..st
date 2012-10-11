as yet unclassified
scroller: aColumnPanel with: aBlock 

	| section |
	section := OBPhobosPaneScrollerSection new model: aColumnPanel.
	current addSection: section.
	^self current: section do: aBlock