as yet unclassified
updatePanes
	| count |
	model ifNil: [panes := Array new. ^ self].
	count := panes ifNotNil: [panes size] ifNil: [0].
	self basicUpdatePanes.
	self basicUpdateSizing.	
	panes size = count
		ifFalse: ["self hideOrShowScrollBar.s"].
	panes size > count ifTrue: ["self scrollToRight"].
	^ panes