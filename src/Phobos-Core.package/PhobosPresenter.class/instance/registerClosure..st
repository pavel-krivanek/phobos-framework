as yet unclassified
registerClosure: aClosure

	| closureId |
	closureId := self session registerClosure: aClosure.
	self registeredClosures add: closureId.
	^ closureId.