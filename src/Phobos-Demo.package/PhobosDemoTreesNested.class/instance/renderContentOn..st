as yet unclassified
renderContentOn: xul

	| sectionId script | 
			
	script := '(this.contentView.getItemAtIndex(this.currentIndex)).firstChild.firstChild.getAttribute("label")'.

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'XUL Childless Trees'.]."
			
		xul groupbox flex: 2; with: [
			xul caption label: 'single selection'.
			xul tree flex: 1; hidecolumnpicker: true; seltype: 'single'; 
				onselect: script; with: [
					xul treecols with: [
						xul treecol id: 'name1'; flex: 1; label: 'Name'.	
						xul treecol id: 'sex1'; flex: 1; label: 'Sex'.	
						xul treecol id: 'name1'; flex: 1; label: 'Color'.	
						xul treecol id: 'name1'; flex: 1; label: 'Attribute'.].
					xul treechildren with: [
					self data do: [:person |
						xul treeitem with: [
							xul treerow with: [
								person do: [:value |
									xul treecell label: value]]]]]]].
		
		xul groupbox flex: 3; with: [
			xul caption label: 'multiple selection, with columnpicker and separator'.
			xul tree flex: 1; hidecolumnpicker: false; seltype: 'multiple'; 
				onselect: ''; with: [
					xul treecols with: [
						xul treecol flex: 1; label: 'Name'.	
						xul treecol flex: 1; label: 'Sex'.	
						xul treecol flex: 1; label: 'Attribute'.].
					xul treechildren with: [
					self data2 do: [:person |
						person ifNotNil: [
							xul treeitem with: [
								xul treerow with: [
									person do: [:value |
										xul treecell label: value]]]]
							ifNil: [
								xul treeseparator].
						]]]].

		xul groupbox flex: 2; with: [
			xul caption label: 'with dragable, resizable columns'.
			xul tree flex: 1; hidecolumnpicker: false; enableColumnDrag: true; with: [
				xul treecols with: [
					xul treecol flex: 1; label: 'Name'.
					xul splitter class: 'tree-splitter'.	
					xul treecol flex: 1; label: 'Sex'.	
					xul splitter class: 'tree-splitter'.	
					xul treecol flex: 1; label: 'Color'.	
					xul splitter class: 'tree-splitter'.	
					xul treecol flex: 1; label: 'Attribute'.].
				xul treechildren with: [
				self data do: [:person |
					xul treeitem with: [
						xul treerow with: [
							person do: [:value |
								xul treecell label: value]]]]]]].		
		
		
		]