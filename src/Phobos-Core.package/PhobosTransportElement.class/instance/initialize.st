accessing
initialize

	super initialize.
	
	text := nil.
	children := OrderedCollection new.
	attributes := OrderedCollection new.
	namespace := String new.
	prefix := String new.
	tagName := String new.