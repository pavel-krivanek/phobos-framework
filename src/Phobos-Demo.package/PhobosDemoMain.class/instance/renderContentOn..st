as yet unclassified
renderContentOn: xml

	| list srcSectionId ajax srcSection |
"	
	listId := WAExternalID new.
	srcSectionId := WAExternalID new.
"
	self renderMenuOn: xml.
"		
	ajax := xml ajax
		callback: [
			| index oldChild |
			index := WACurrentSession value currentRequest fields at: '_param1'.
			oldChild := child.
			child := (self pages at: index + 1) value new.
			self replaceRequestOf: oldChild to: child.
			self refreshRequest: srcSectionId block: [:canvas |
				self renderSourceOn: canvas] ].
	ajax parameters at: '_param1' put: 'this.selectedIndex'.
	"		

	xml hbox flex: 1; with: [
		list := xml listbox
			style:'width:10em'; 
			onselect: [
				| newComponent selectedIndex |
				selectedIndex := list get: #selectedIndex.
				newComponent := (self pages at: selectedIndex + 1) value on: self window.
				newComponent replace: child.
				child := newComponent.
				srcSection refresh.
				];
			with: [
				self pages do: [:pageAssoc |
					xml listitem label: pageAssoc key]];
			yourself.
		
		xml splitter collapse: #before; resizebefore: #closest; resizeafter: #grow; with: [
			xml grippy ].
		
		xml tabbox flex: 1; with: [
			xml tabs with: [
				xml tab label: 'Examples'.
				xml tab label: 'Source'.].
			xml tabpanels flex: 1; with: [
				xml tabpanel with: [ xml vbox flex: 1; style: 'overflow: auto'; with: [xml render: child] ].
				xml tabpanel with: [ 
					srcSection := xml section: [
						self renderSourceOn: xml.
						]].
				xml tabpanel. ]].
	].

	self renderStatusBarOn: xml.
		