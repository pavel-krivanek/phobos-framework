as yet unclassified
renderMenuItem: aMenuItem on: xul

	aMenuItem = #line 
		ifTrue: [ xul menuseparator. ^ self].

	aMenuItem isMenu 
		ifFalse: [
			xul menuitem 
				label: aMenuItem label;
				disabled: aMenuItem enabled not;
				oncommand: [aMenuItem target perform: aMenuItem		 selector].]
		ifTrue: [
			xul menu 
				label: aMenuItem label; 
				disabled: aMenuItem enabled not;
				with: [
					xul menupopup 
						with: [ 
							aMenuItem items do: [:item |
								self renderMenuItem: item on: xul]]]]



	