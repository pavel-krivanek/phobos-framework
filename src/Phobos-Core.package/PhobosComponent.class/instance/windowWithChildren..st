accessing
windowWithChildren: aWindow
	
	window := aWindow.
	self children do: [:child |
		child window: window].