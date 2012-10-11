as yet unclassified
renderContentOn: xul

	| ajax popupId popupSectionId menuAjax listbox |
	

"	ajax parameters at: '_param1' put: 'this.selectedIndex'.

	popupId  := WAExternalID new.
	popupSectionId  := WAExternalID new.

	menuAjax := (XULAjaxPopup on: xul)
		callback: [
			| menu |
			menu := OBXulMenu new. 
			model perform: getMenuSelector with: menu.
			self refreshRequest: popupSectionId block: [:x | self renderMenu: menu on: x]
			].
	ajax parameters at: '_param1' put: 'this.selectedIndex'.
"	
	xul popupset with: [
		xul menupopup 
			id: popupId; 
			onpopupshowing: [
				| menu |
				menu := OBPhobosMenu new. 
				model perform: getMenuSelector with: menu.
				self refreshRequest: popupSectionId block: [:x | self renderMenu: menu on: x]
				];	
			with: ["xul section: popupSectionId with: []"].
	].
	
	listbox := xul listbox 
		flex: 1;
		onselect: [
			| index |
		"	menu := OBXulMenu new. 
			model perform: getMenuSelector with: menu.
			menu halt."
			"index := WACurrentSession value currentRequest fields at: '_param1'."
			index := listbox get: #selectedIndex.
			index := index asInteger + 1.
			model perform: setIndexSelector with: index.
			];
		context: popupId;
		with: [  
			| array selected |
			array := model perform: getListSelector.
			selected := model perform: getIndexSelector.
			array withIndexDo: [:name :index |
				xul listitem 
					label: name; 
					attributesAt: 'phobos:value' put: name asString;
					selected: (index = selected)]];
		yourself.
