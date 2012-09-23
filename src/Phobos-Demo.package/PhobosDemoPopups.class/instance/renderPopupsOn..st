as yet unclassified
renderPopupsOn: xul

	xul popupset with: [
		
		xul menupopup id: 'contextpoupup'; with: [
			xul menuitem label: 'This is a context popup'.].
		
		xul menupopup id: 'popupmenu'; with: [
			xul menuitem label: 'Pearl'.
			xul menuitem label: 'Aramis'.
			xul menuitem label: 'Yakima'.].
		
		xul menupopup id: 'start_before'; position: 'start_before'; with: [
			xul menuitem label: 'To the left of the button'.
			xul menuitem label: 'aligned on the top'.].
		
		xul menupopup id: 'before_start'; position: 'before_start'; with: [
			xul menuitem label: 'Above the button'.
			xul menuitem label: 'aligned on the left'.].
	
		xul menupopup id: 'before_end'; position: 'before_end'; with: [
			xul menuitem label: 'Above the button'.
			xul menuitem label: 'aligned on the right'.].
	
		xul menupopup id: 'end_before'; position: 'end_before'; with: [
			xul menuitem label: 'To the right of the button'.
			xul menuitem label: 'aligned on the top'.].
	
		xul menupopup id: 'start_after'; position: 'start_after'; with: [
			xul menuitem label: 'To the left of the button'.
			xul menuitem label: 'ligned on the bottom'.].
	
		xul menupopup id: 'after_start'; position: 'after_start'; with: [
			xul menuitem label: 'Below the button'.
			xul menuitem label: 'aligned on the left'.].
	
		xul menupopup id: 'after_end'; position: 'after_end'; with: [
			xul menuitem label: 'Below the button'.
			xul menuitem label: 'aligned on the right'.].
	
		xul menupopup id: 'end_after'; position: 'end_after'; with: [
			xul menuitem label: 'To the right of the button'.
			xul menuitem label: 'aligned on the bottom'.].
	
		xul menupopup id: 'overlap'; position: 'overlap'; with: [
			xul menuitem label: 'On top of the button'.].
	
		xul menupopup id: 'at_pointer'; position: 'at_pointer'; with: [
			xul menuitem label: 'At the pointer'.].
	
		xul menupopup id: 'after_pointer'; position: 'after_pointer'; with: [
			xul menuitem label: 'Below the button'.
			xul menuitem label: 'aligned with the pointer'.].
	]