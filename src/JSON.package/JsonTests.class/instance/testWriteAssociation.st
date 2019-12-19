as yet unclassified
testWriteAssociation
	self render: 'key' -> 'value' equals: '"key": "value"'.
	self render: 'key' -> 2 equals: '"key": 2'.
	"keys should be strings"
	self render: 42 -> 2 equals: '"42": 2'.
	"try to do _something_ for more complex keys"
	self render: #(42 43 44) -> 2 equals:  '"#(42 43 44)": 2'.
	
	
	