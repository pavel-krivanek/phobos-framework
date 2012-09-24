as yet unclassified
renderContentOn: xul

	|  removeButton replaceButton |
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [

		"xul description with: [xul heading: 'Components'.]."
			
			xul groupbox with: [
				xul caption label: 'Component refreshing'.
				xul description value: 'Current time: ', DateAndTime now asString.
				xul button label: 'Refresh'; oncommand: [self refresh].].

			xul groupbox with: [
				xul caption label: 'Embedded child'.
				xul hbox with: [
					replaceButton := xul button label: 'Replace';  disabled: (child isNil); 
						oncommand: [
							| newComponent |
							newComponent := self class on: self window.
							newComponent replace: child.
							child := newComponent.];
						yourself.
					removeButton := xul button label: 'Remove'; disabled: (child isNil); 
						oncommand: [
							removeButton set: #disabled to: true. 
							replaceButton set: #disabled to: true. 
							child remove.
							child := nil.];
							yourself.].
				xul tabbox flex: 1; with: [ 
					xul tabs with: [xul tab label: 'Child'].
					xul tabpanels flex: 1; with: [xul render: child ]]]].