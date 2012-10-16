as yet unclassified
renderDateInputsOn: xul

		xul groupbox with: [
			xul caption label: 'integer input for date input'.
			
			xul hbox pack: #center;  with: [ xul hbox style: 'background-color: white; padding: 2pt'; with: [
			xul textbox 
				class: #plain;
				style: 'width:3em;margin-right 0px;'; "one character longer than required input length"
				attributesAt: 'phobos:maxlength' put: 2;
				attributesAt: #onkeypress put: 'phobos.integerInputOnKeyPress(this, event)';	
				attributesAt: #clickSelectsAll put: true;
				value: 11.
			xul text: '.'.
			xul textbox 
				class: #plain;
				style: 'width:3em;margin-right: 0px; margin-left: 0px;';
				attributesAt: 'phobos:maxlength' put: 2;
				attributesAt: #onkeypress put: 'phobos.integerInputOnKeyPress(this, event)';	
				attributesAt: #clickSelectsAll put: true;
				value: 10.
			xul text: '.20'.
			xul textbox 
				class: #plain;
				style: 'width:3em; margin-left: 0px;';
				attributesAt: 'phobos:maxlength' put: 2;
				attributesAt: #onkeypress put: 'phobos.integerInputOnKeyPress(this, event)';	
				attributesAt: #clickSelectsAll put: true;
				value: 12.		]
				
				
		]]
	

	