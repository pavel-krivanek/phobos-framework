as yet unclassified
renderContentOn: xul

	| list srcSectionId ajax srcSection |

	self renderMenuOn: xul.

	xul hbox flex: 1; with: [
		list := xul listbox
			style:'width:10em'; 
			onselect: [
				| newComponent selectedIndex |
				selectedIndex := list get: #selectedIndex.
				newComponent := (self pages at: selectedIndex + 1) value on: self window.
				newComponent replace: child.
				child := newComponent.
				self refreshSource.
				
				];
			with: [
				self pages do: [:pageAssoc |
					xul listitem label: pageAssoc key]];
			yourself.
		
		xul splitter collapse: #before; resizebefore: #closest; resizeafter: #grow; with: [
			xul grippy ].
		
		xul tabbox flex: 1; with: [
			xul tabs with: [
				xul tab label: 'Examples'.
				xul tab label: 'Source'.].
			xul tabpanels flex: 1; with: [
				xul tabpanel with: [ xul vbox flex: 1; style: 'overflow: auto'; with: [xul render: child] ].
				xul tabpanel with: [ 
					srcSection := xul section: [
						self renderSourceOn: xul.
						]].
				xul tabpanel. ]].
	].

	self renderStatusBarOn: xul.
		