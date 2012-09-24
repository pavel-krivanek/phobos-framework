accessing
window: aWindow
	
	window := aWindow.
	self children do: [:child |
		child window: window].