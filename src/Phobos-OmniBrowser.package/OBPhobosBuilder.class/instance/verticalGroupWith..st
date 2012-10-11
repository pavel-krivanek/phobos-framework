as yet unclassified
verticalGroupWith: aBlock 
	| section |
	section := OBPhobosGroupingSection new.
	section orientation: #vertical.
	current addSection: section.
	self current: section do: aBlock