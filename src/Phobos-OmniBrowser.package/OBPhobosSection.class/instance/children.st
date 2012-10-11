as yet unclassified
children

	| collection |
	collection := OrderedCollection new.
	self subsections do: [:each | collection addAll: each children].
	^ collection