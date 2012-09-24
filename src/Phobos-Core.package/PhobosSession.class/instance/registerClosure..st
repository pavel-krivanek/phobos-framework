as yet unclassified
registerClosure: aBlock 

	| closureId |
	
	closureId := PhobosId new.
	closures at: closureId put: aBlock.
	
	^ closureId
	