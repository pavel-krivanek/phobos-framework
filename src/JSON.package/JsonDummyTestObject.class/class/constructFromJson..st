as yet unclassified
constructFromJson: j
	^ self new a: (j at: 'a'); b: (j at: 'b'); c: (j at: 'c'); yourself