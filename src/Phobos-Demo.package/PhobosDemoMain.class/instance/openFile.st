as yet unclassified
openFile

	| result |
	result := self evaluateJS:'phobos.openFileDialog("Select a file", "modeOpen", 15, ["my filter 1", "*.bak", "my filter 2", "*.wrk"]);'.
	(Json readFrom: result readStream) inspect.