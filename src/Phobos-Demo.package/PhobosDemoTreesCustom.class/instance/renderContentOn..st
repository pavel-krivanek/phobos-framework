as yet unclassified
renderContentOn: xul
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [
		xul description with: [xul heading: 'XUL Custom Trees'. ].
	
		xul description with: [xul text: 'A tree view with custom images and 1000000 of rows'].
		
		tree := xul tree flex: 1; with: [
			xul treecols with: [
				numCol := xul treecol flex: 1; label: 'Number'; primary: true; yourself.	
				textCol1 := xul treecol flex: 1; label: 'Text 1'; yourself.	
				textCol2 := xul treecol flex: 1; label: 'Text 2'; yourself.	 ].
			xul treechildren ];
			yourself.
			
]