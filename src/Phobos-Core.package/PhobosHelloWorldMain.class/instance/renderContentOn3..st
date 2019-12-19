as yet unclassified
renderContentOn3: xul

	xul button 
		label: 'Say Hello';
		oncommand:  [
			| result |
			result := self evaluateJS: '3+4'.
			self evaluateJS: ('alert("', result asString, '")')].