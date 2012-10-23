as yet unclassified
renderContentOn: xul

	|  form section |
	
	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'Forms'.].
		
		xul hbox flex: 1; with: [
			xul vbox with: [
				xul groupbox with: [
					xul caption label: 'form'.
					form := xul form: [
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'name:'.
							xul textbox on: #name of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'surname:'.
							xul textbox emptytext: 'empty'; on: #surname of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'number 1:'.
							xul textbox type: #number; on: #number1 of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'number 2:'.
							xul textbox type: #number; hidespinbuttons: true; min: 10; max: 20; on: #number2 of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'scale:'.
							xul scale min: 1; max: 100; on: #scale of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'password:'.
							xul textbox type: #password; on: #password of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: ''.
							xul checkbox label: 'remember me'; on: #rememberMe of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'color:'.
							xul colorpicker type: #button; on: #color of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'date:'.
							xul datepicker type: #popup; firstdayofweek: 1; on: #date of: self.].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'gender:'.
							xul radiogroup 
								on: #gender of: self values: #(male female) ].
						xul hbox align: #center; with: [
							xul label style: 'width: 10em'; with: 'items:'.
							xul listbox seltype: #multiple; 
								rows: 6; 
								on: #items of: self values: #('item 1' 'item 2' 'item 3' 'item 4' 'item 5') ].
					xul hbox pack: #center; with: [
							xul button label: 'Submit'; style: 'width: 10em'; oncommand: [
								self processForm: form.
								form refresh.
								section refresh
								].
							xul button label: 'Restore'; style: 'width: 10em'; oncommand: [
								form refresh.
								].
							]]]].
					section := xul section: [
						self renderResultsOn: xul]										
				]] 