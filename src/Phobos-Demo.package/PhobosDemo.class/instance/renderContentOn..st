as yet unclassified
renderContentOn: xml

	| listId srcSectionId ajax |
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
		xml listbox
			id: listId; 
			style:'width:10em'; 
			onselect: (ajax);
			with: [
				self pages do: [:pageAssoc |
					xml listitem label: pageAssoc key]].
		
		xml splitter collapse: #before; resizebefore: #closest; resizeafter: #grow; with: [
			xml grippy ].
		
		xml tabbox flex: 1; with: [
			xml tabs with: [
				xml tab label: 'Examples'.
				xml tab label: 'Source'.].
			xml tabpanels flex: 1; with: [
				xml tabpanel with: [ xml render: child ].
				xml tabpanel with: [ 
					"xml section: srcSectionId with: [
						self renderSourceOn: xml ] "].
				xml tabpanel. ]].
	].

	self renderStatusBarOn: xml.
			