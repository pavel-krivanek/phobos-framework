as yet unclassified
choose
	
	| appClass |
	appClass := UIManager default chooseDropList: 'Select  Phobos application to activate on default port' list: PhobosApplication 	allSubclasses.
	PhobosApplication allSubInstancesDo: #stop.
	appClass new start. 