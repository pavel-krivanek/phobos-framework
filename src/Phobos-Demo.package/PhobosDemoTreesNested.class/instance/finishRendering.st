as yet unclassified
finishRendering

	self evaluateJS: 'phobos.getWindow("', self window asString, '").document.styleSheets[0].insertRule("treechildren::-moz-tree-cell-text(blueText){color: blue;}", 1);'.
	
