accessing
replace: oldComponent

	| renderer |
	oldComponent canBeReplaced ifTrue: [
		renderer := self rendered.
		oldComponent clearClosures.
		self session replace: oldComponent with: renderer.
		self finishRenderingWithChildren.]