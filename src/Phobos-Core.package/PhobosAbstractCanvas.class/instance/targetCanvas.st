accessing
targetCanvas

	^ parentCanvas 
		ifNil: [self]
		ifNotNil: [parentCanvas].
		