as yet unclassified
finishRendering

	super finishRendering.

	self subsections do: [:section |
		section finishRendering]