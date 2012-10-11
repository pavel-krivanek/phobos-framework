as yet unclassified
renderContentOn: xul

	| list selected ajax tabs |
	
"	ajax := xul ajax
		callback:
	ajax parameters at: '_param1' put: 'this.getAttribute(seasidexul:value)'."
	
	list := self model perform: getListSelector.
	selected := self model perform: getSelectionSelector.
	list ifEmpty: [ ^ self].

	tabs := xul tabs class: 'tabs-bottom'; with: [
		list do: [:item | 
			xul tab 
				class: 'tab-bottom'; 
				label: item; 
				selected: (item = selected);
				attributesAt: 'phobos:value' put: item asString;
				oncommand:  [
					| index |
					index := tabs get: #selectedIndex.
					"index := (self model perform: getListSelector) indexOf: (self fieldAt: '_param1')."
					model perform: setSelectionSelector with: index.
					]. ]];
		yourself.