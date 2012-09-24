accessing
rendered

	| renderer |
	
	self clearClosures.
	renderer := self rendererClass for: self.
	
	[	renderer sectionStart: self id.
		self renderContentOn: renderer.
		renderer sectionEnd: self id.
	] on: PhobosContinuationNotification do: [:n | "do nothing" ].
			
	^ renderer
	