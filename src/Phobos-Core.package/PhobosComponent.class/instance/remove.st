accessing
remove

	| renderer |
	self canBeReplaced ifTrue: [
		self clearClosures.
		self session replace: self with: (self rendererClass for: self)]