as yet unclassified
renderContentOn: xul

	| output i1 i2 i3 i4 i5 |
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Textboxes'.].
		xul hbox align: 'center'; with: [
			xul label style: 'width:10em'; value: 'Default:'.
			i1 := xul textbox oninput: [output set: #value to: (i1 get: #value)]; yourself].
		xul hbox align: 'center'; with: [
			xul label style: 'width:10em'; value: 'Disabled:'.
			xul textbox disabled: true; value: 'disabled'; oninput: [output set: #value to: (i1 get: #value)]; yourself].
		xul hbox align: 'center'; with: [
			xul label style: 'width:10em'; value: 'Readonly:'.
			i2 := xul textbox readonly: true; value: 'readonly'; oninput: [output set: #value to: (i2 get: #value)]; yourself].
		xul hbox align: 'center'; with: [
			xul label style: 'width:10em'; value: 'Max length of 20:'.
			i3 := xul textbox maxlength: 20; size: 20; oninput: [output set: #value to: (i3 get: #value)]; yourself].
		xul hbox align: 'center'; with: [
			xul label style: 'width:10em'; value: 'Password:'.
			i4 := xul textbox type: 'password'; oninput: [output set: #value to: (i4 get: #value)]; yourself].
		xul hbox align: 'center'; with: [
			xul label style: 'width:10em'; value: 'Multiline:'.
			i5 := xul textbox multiline: true; rows: 7; cols: 20; oninput: [output set: #value to: (i5 get: #value)]; yourself].
		xul hbox align: 'center'; with: [
			xul label style: 'width:10em'; value: 'Input:'.
			xul hbox pack: 'center'; with: [
				output := xul description 
					value: '(no input yet)';
					yourself]].
]