as yet unclassified
horizontalGroupWith: aBlock 
	| section |
	section := OBPhobosGroupingSection new.
	section orientation: #horizontal.
	current addSection: section.
	self current: section do: aBlock
