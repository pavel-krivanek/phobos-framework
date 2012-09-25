as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Tabs'.].
			
		xul groupbox with: [
			xul description with: 'This is the standard tabbox.  It looks fine.'.
			xul groupbox with: [
				xul tabbox flex: 1; with: [
					xul tabs with: [
						xul tab label: 'Default'.
						xul tab label: 'Tab'.
						xul tab label: 'Orientation'.].
					xul tabpanels flex: 1; with: [
						xul label value: 'Default'.
						xul label value: 'Tab'.
						xul label value: 'Orientation'.]]]].
		
		xul groupbox with: [
			xul description with: 'This one has been turned on its head so that the tabs 
  					are on the bottom.  I had to fiddle with the styles to 
   					make this look decent.'.
			xul groupbox with: [
				xul tabbox flex: 1; with: [
					xul tabpanels flex: 1; style: 'border-bottom: 0px solid'; with: [
						xul label value: 'Tabs'.
						xul label value: 'on the'.
						xul label value: 'bottom'.].
					xul tabs flex: 1; class: 'tabs-bottom'; with: [
						xul tab label: 'Tabs'; class: 'tab-bottom'.
						xul tab label: 'on the'; class: 'tab-bottom'.
						xul tab label: 'bottom'; class: 'tab-bottom'.]]]].
		
		xul groupbox with: [
			xul description with: 'And here are a couple with the tabs on the side.  They work, but
   they''ll need a bunch of style changes to make them look reasonable.'.
			xul groupbox with: [
				xul hbox with: [
					xul tabbox flex: 1; orient: 'horizontal'; with: [
						xul tabs orient: 'vertical'; class: 'tabs-left'; with: [
							xul tab label: 'Tabs'; class: 'tab-left'.
							xul tab label: 'on the'; class: 'tab-left'.
							xul tab label: 'left'; class: 'tab-left'.].
						xul tabpanels flex: 1; with: [
							xul label value: 'Tabs'.
							xul label value: 'on the'.
							xul label value: 'left'.]].
					xul spacer flex: 1.
					xul tabbox flex: 1; orient: 'horizontal'; dir: 'reverse'; with: [
						xul tabs orient: 'vertical'; class: 'tabs-'; with: [
							xul tab label: 'Tabs'.
							xul tab label: 'on the'.
							xul tab label: 'left'].
						xul tabpanels flex: 1; with: [
							xul label value: 'Tabs'.
							xul label value: 'on the'.
							xul label value: 'left'.]].
					
					]]].
	]