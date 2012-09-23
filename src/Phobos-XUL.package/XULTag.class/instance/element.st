as yet unclassified
element
	
	self assert: self id notNil.

	^ 'window.document.getElementById("',  self id, '")'