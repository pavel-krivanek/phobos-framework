as yet unclassified
pane: aColumn with: aBlock 

	| section |
	section := OBPhobosPaneSection new model: aColumn.
	section addList: (self listSectionForColumn: aColumn).
	current ifNotNil: [ current pushPane: section ].
	^self current: section do: aBlock