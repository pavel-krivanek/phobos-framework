as yet unclassified
from: jsonString

	| dict obj |
	
	dict := Json readFrom: jsonString readStream.
	obj := self new.
	dict keysDo: [:key |
		obj perform: (key, ':') asSymbol with: (dict at: key)].
	
	^ obj
		