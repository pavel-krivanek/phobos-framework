as yet unclassified
renderContentOn: xml

	xml vbox flex: 1; style: 'overflow: auto'; with: [

		"xml description with: [xml heading: 'XUL Grids'.]."
			
		xml groupbox with: [
			xml caption label: 'data in the rows'.
			
			xml grid with: [
				xml columns with: [
					xml column flex: 1.
					xml column flex: 1.
					xml column flex: 1.
					xml column flex: 1.].
				xml rows with: [
					xml row with: [
						xml button label: 'Name'.
						xml button label: 'Sex'.
						xml button label: 'Color'.
						xml button label: 'Description'.].
					xml row with: [
						xml label value: 'Pearl'.
						xml label value: 'Female'.
						xml label value: 'Gray'.
						xml label value: 'Frumpy'.].
					xml row with: [
						xml label value: 'Aramis'.
						xml label value: 'Male'.
						xml label value: 'Black'.
						xml label value: 'Cute'.].
					xml row with: [
						xml label value: 'Yakima'.
						xml label value: 'Male'.
						xml label value: 'Holstein'.
						xml label value: 'Handsome'.].
					xml row with: [
						xml label value: 'Cosmo'.
						xml label value: 'Female'.
						xml label value: 'White'.
						xml label value: 'Round'.].
					xml row with: [
						xml label value: 'Fergus'.
						xml label value: 'Male'.
						xml label value: 'Black'.
						xml label value: 'Long'.].
					xml row with: [
						xml label value: 'Clint'.
						xml label value: 'Male'.
						xml label value: 'Black'.
						xml label value: 'Young'.].
					xml row with: [
						xml label value: 'Tribble'.
						xml label value: 'Female'.
						xml label value: 'Orange'.
						xml label value: 'Frumpy'.].
					xml row with: [
						xml label value: 'Zippy'.
						xml label value: 'Male'.
						xml label value: 'Orange'.
						xml label value: 'Playful'.].
					xml row with: [
						xml label value: 'Zippy'.
						xml label value: 'Male'.
						xml label value: 'Orange'.
						xml label value: 'Playful'.].
					].
				]
			].
		
		xml groupbox with: [
			xml caption label: 'data in the columns'.
			
			xml grid with: [
				xml rows with: [
					xml row.
					xml row.
					xml row.
					xml row.].
				xml columns with: [
					xml column flex: 1; with: [
						xml button label: 'Name'.
						xml button label: 'Sex'.
						xml button label: 'Color'.
						xml button label: 'Description'.].
					xml column flex: 1; with: [
						xml label value: 'Pearl'.
						xml label value: 'Female'.
						xml label value: 'Gray'.
						xml label value: 'Frumpy'.].
					xml column flex: 1; with: [
						xml label value: 'Aramis'.
						xml label value: 'Male'.
						xml label value: 'Black'.
						xml label value: 'Cute'.].
					xml column flex: 1; with: [
						xml label value: 'Yakima'.
						xml label value: 'Male'.
						xml label value: 'Holstein'.
						xml label value: 'Handsome'.].
					xml column flex: 1; with: [
						xml label value: 'Cosmo'.
						xml label value: 'Female'.
						xml label value: 'White'.
						xml label value: 'Round'.].
					xml column flex: 1; with: [
						xml label value: 'Fergus'.
						xml label value: 'Male'.
						xml label value: 'Black'.
						xml label value: 'Long'.].
					xml column flex: 1; with: [
						xml label value: 'Clint'.
						xml label value: 'Male'.
						xml label value: 'Black'.
						xml label value: 'Young'.].
					xml column flex: 1; with: [
						xml label value: 'Tribble'.
						xml label value: 'Female'.
						xml label value: 'Orange'.
						xml label value: 'Frumpy'.].
					xml column flex: 1; with: [
						xml label value: 'Zippy'.
						xml label value: 'Male'.
						xml label value: 'Orange'.
						xml label value: 'Playful'.].
					].
				]
			]
	]