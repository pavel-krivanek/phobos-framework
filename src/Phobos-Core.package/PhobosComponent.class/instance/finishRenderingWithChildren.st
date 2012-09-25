accessing
finishRenderingWithChildren

	self finishRendering.
	self children do: [:child |
		child finishRenderingWithChildren].