accessing
nextPresentersDo: aBlock	
	
	self childrenDo: [:ea | ea decorationChainDo: aBlock]