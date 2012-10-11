as yet unclassified
renderContentPaneOn: xul 

	xul render: workspace.

	"xul textFieldOn: nil accept: nil.
	xul enhancedCodeEditor: nil on: nil accept: nil content: '
	
3 + 4
	
XULPeriodicTable new openInNewWindow.

OBSystemBrowser open.

XULLauncher new openInNewWindow.

XULDebugErrorHandler processesToDebug.
XULDebugErrorHandler reset.
XULDebugErrorHandler processesToDebug do: [:p | p value resume].

1 asdf
', Character alphabet shuffled.


"


