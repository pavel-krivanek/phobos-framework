as yet unclassified
element
	
	self assert: self id notNil.

	^ 'phobos.getWindow("', self canvas component window asString, '").document.getElementById("',  self id, '")'