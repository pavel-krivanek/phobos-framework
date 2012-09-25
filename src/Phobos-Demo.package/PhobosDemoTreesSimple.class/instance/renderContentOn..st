as yet unclassified
renderContentOn: xul


	xul vbox flex: 1; style: 'overflow: auto'; with: [
		xul description with: [xul heading: 'XUL Nested Trees'. ].

	
	xul hbox flex: 1; style: 'overflow: auto'; with: [
		xul tree flex: 1; with: [
			xul treecols with: [
				xul treecol id: 'sex1'; flex: 1; label: 'Name'; primary: true.	
				xul treecol id: 'color1'; flex: 1; label: 'Color'.
				xul treecol id: 'attr1'; flex: 1; label: 'Attribute'. ].
			xul treechildren with: [
				self data1 do: [:gender |
					xul treeitem container: true; open: true; with: [
						xul treerow with: [
							xul treecell label: gender first].
						xul treechildren	 with: [
							gender second do: [:person |
								xul treeitem with: [
									xul treerow with: [
										xul treecell label: person first.
										xul treecell label: person second.
										xul treecell label: person third.]]]]]]]].

		xul tree flex: 1; hidecolumnpicker: true; with: [
			xul treecols with: [
				xul treecol flex: 1; label: 'Cats'; primary: true.	].
			xul treechildren with: [
				self data2 do: [:gender |
					xul treeitem container: true; open: true; with: [
						xul treerow with: [
							xul treecell label: gender first].
						xul treechildren	 with: [
							gender second do: [:color |
								xul treeitem container: true; open: true; with: [
									xul treerow with: [ xul treecell label: color first ].
									xul treechildren with: [
										color second do: [:person |
											xul treeitem with: [
												xul treerow with: [
													xul treecell label: person ]]]]]]]]]]].
			
]]