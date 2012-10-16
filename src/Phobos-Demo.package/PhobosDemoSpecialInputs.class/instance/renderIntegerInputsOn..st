as yet unclassified
renderIntegerInputsOn: xul

		xul groupbox with: [
			xul caption label: 'integer input with automatic focus change'.
			
			xul description flex: 1; with:  'This text boxes allow only integer inputs of length 1, 2 and 4 digits. When valid input is written, focus is moved automatically'.
			xul hbox pack: #center; with: [
			xul textbox 
				style: 'width:2em'; "one character longer than required input length"
				attributesAt: 'phobos:maxlength' put: 1;
				attributesAt: #onkeypress put: 'phobos.integerInputOnKeyPress(this, event)';	
				attributesAt: #clickSelectsAll put: true;
				value: '1'.
			xul textbox 
				style: 'width:3em';
				attributesAt: 'phobos:maxlength' put: 2;
				attributesAt: #onkeypress put: 'phobos.integerInputOnKeyPress(this, event)';	
				attributesAt: #clickSelectsAll put: true;
				value: '42'.
			xul textbox 
				style: 'width:5em';
				attributesAt: 'phobos:maxlength' put: 4;
				attributesAt: #onkeypress put: 'phobos.integerInputOnKeyPress(this, event)';	
				attributesAt: #clickSelectsAll put: true;
				value: '1234'.		]
				
				
		]
	

	