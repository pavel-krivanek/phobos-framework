as yet unclassified
renderContentOn: html


	html h1 with: 'Phobos Hello World Demo '.
	html h2 with: 'Count: ', count asString.

	html div with: [
		html button 
			onClick:  [ 
				count := count + 1.
				self refresh ];
			with: '+'.
		html button 
			onClick:  [ 
				count := count - 1.
				self refresh ];
			with: '+' ].		
		
	html div with: [
		html button 
			onClick:  [
				self evaluateJS: ('Hello World)')];
			with: 'Say Hello'. ].
		
	html button 
		onClick:  [
			| result |
			result := self evaluateJS: 'window.innerWidth'.
			self evaluateJS: ('alert("', result asString, '")')];
		with: 'Get window width'.


		