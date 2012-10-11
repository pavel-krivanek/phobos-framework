as yet unclassified
renderContentOn: xul

	self orientation = #vertical 
		ifTrue: [
			xul vbox flex: 1; with: [ super renderContentOn: xul ]]
		ifFalse: [
			xul hbox flex: 1; with: [ super renderContentOn: xul ]].