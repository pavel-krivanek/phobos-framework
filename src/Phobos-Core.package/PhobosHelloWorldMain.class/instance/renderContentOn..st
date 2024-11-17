as yet unclassified
renderContentOn: html

| closureId |

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
				self evaluateJS: ('alert("Hello World")')];
			with: 'Say Hello'. ].
	
	
	closureId := self registerClosure: [:message | message argument traceCr ].
	
	html input attributesAt: #oninput put: ('phobos.runClosure("{1}", event.target.value)' format: {closureId}).	
		
	html button 
		onClick:  [
			| result |
			result := self evaluateJS: 'window.innerWidth'.
			self evaluateJS: ('alert("', result asString, '")')];
		with: 'Get window width'.


		