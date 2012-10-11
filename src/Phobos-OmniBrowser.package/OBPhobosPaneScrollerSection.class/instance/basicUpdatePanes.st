as yet unclassified
basicUpdatePanes

	| builder |
	builder := OBPhobosBuilder new.
	panes := model 
		ifNil: [Array new]
		ifNotNil: [model columns collect: [:ea | ea buildOn: builder]].		
	self clearPanes.
	panes do: [:ea | self pushPane: ea].

