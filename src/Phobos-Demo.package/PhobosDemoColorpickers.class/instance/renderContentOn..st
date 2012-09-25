as yet unclassified
renderContentOn: xul

	|  picker1 color1 picker2 color2 |
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Colorpickers'.].
		xul hbox with: [
			
			xul groupbox with: [
				xul caption label: 'default colorpicker'.
				picker1 := xul colorpicker 
					onselect: [color1 set: #value to: (picker1 get: #color)];
					yourself.
				
			xul hbox pack: 'center'; with: [
				color1 := xul description 
					value: '(no input yet)';
					yourself].
			].

			xul groupbox with: [
				xul caption label: 'button type'.
				xul description value: 'Press the button'.
				xul description value: 'and doubleclick'.
				xul description value: 'to select a color'.
				picker2 := xul colorpicker 
					type: 'button'; 
					palettename: 'standard'; 
					onselect: [color2 set: #value to: (picker2 get: #color)];
					yourself.
				
			xul hbox pack: 'center'; with: [
				color2 := xul description 
					value: '(no input yet)';
					yourself].
			].
		]
	]