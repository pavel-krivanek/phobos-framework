as yet unclassified
renderContentOn2: xul

	xul button 
		label: 'Say Hello';
		oncommand:  [
			| result |
			result := self evaluateJS: '3+4'.
			self inform: result asString].