as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Scrolling'.].

		xul hbox with: [		
			xul groupbox flex: 1; with: [
				xul caption label: 'The full list'.
				xul vbox with: [
					1 to: 9 do: [:i |
						xul button label: 'Button #', i asString]]].
			xul vbox flex: 1; with: [
				xul groupbox style: 'max-height:8em'; with: [
					xul caption label: 'The list limited in height, no overflow'.
					xul vbox flex: 1; with: [
						1 to: 9 do: [:i |
							xul button label: 'Button #', i asString]]].
				xul groupbox style: 'max-height:8em'; with: [
					xul caption label: 'The list limited in height, auto overflow'.
					xul vbox flex: 1; style: 'overflow: auto'; with: [
						1 to: 9 do: [:i |
							xul button label: 'Button #', i asString]]].
				xul groupbox style: 'max-height:8em'; with: [
					xul caption label: 'The list limited in height, scroll overflow'.
					xul vbox flex: 1; style: 'overflow: scroll'; with: [
						1 to: 9 do: [:i |
							xul button label: 'Button #', i asString]]].]].

		xul description value: 'arrowscrollbox - hover over the arrow to scroll'.
		xul arrowscrollbox orient: 'vertical'; flex: 1;  with: [
			1 to: 31 do: [:i | 
				xul button label: 'item ', i asString ]].
	]