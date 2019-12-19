as yet unclassified
renderContentOn: xul

	xul button 
		onClick:  [
			| result |
			result := self evaluateJS: '3+4'.
			self evaluateJS: ('alert("', result asString, '")')];
		with: 'Say Hello'.