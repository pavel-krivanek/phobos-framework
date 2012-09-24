accessing
refresh

	| renderer |
	renderer := self rendered.
	self session replace: self with: renderer.
	self finishRenderingWithChildren.