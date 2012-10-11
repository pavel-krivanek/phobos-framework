as yet unclassified
renderContentOn: xul 

	browser := xul browser 
		flex: 1;
		type: #content;
		src: (self session baseURI, 'CodeMirror/CodeMirror.html');
		yourself.