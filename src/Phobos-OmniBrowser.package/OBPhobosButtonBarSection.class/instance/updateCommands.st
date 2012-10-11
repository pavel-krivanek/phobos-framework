as yet unclassified
updateCommands

	self removeAllSections.
	model commands do: [:ea | 
		self addButtonFor: ea].
