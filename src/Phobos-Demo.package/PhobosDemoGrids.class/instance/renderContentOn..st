as yet unclassified
renderContentOn: xul

	xul vbox flex: 1; style: 'overflow: auto'; with: [

		xul description with: [xul heading: 'XUL Grids'.].
			
		xul groupbox with: [
			xul caption label: 'data in the rows'.
			
			xul grid with: [
				xul columns with: [
					xul column flex: 1.
					xul column flex: 1.
					xul column flex: 1.
					xul column flex: 1.].
				xul rows with: [
					xul row with: [
						xul button label: 'Name'.
						xul button label: 'Sex'.
						xul button label: 'Color'.
						xul button label: 'Description'.].
					xul row with: [
						xul label value: 'Pearl'.
						xul label value: 'Female'.
						xul label value: 'Gray'.
						xul label value: 'Frumpy'.].
					xul row with: [
						xul label value: 'Aramis'.
						xul label value: 'Male'.
						xul label value: 'Black'.
						xul label value: 'Cute'.].
					xul row with: [
						xul label value: 'Yakima'.
						xul label value: 'Male'.
						xul label value: 'Holstein'.
						xul label value: 'Handsome'.].
					xul row with: [
						xul label value: 'Cosmo'.
						xul label value: 'Female'.
						xul label value: 'White'.
						xul label value: 'Round'.].
					xul row with: [
						xul label value: 'Fergus'.
						xul label value: 'Male'.
						xul label value: 'Black'.
						xul label value: 'Long'.].
					xul row with: [
						xul label value: 'Clint'.
						xul label value: 'Male'.
						xul label value: 'Black'.
						xul label value: 'Young'.].
					xul row with: [
						xul label value: 'Tribble'.
						xul label value: 'Female'.
						xul label value: 'Orange'.
						xul label value: 'Frumpy'.].
					xul row with: [
						xul label value: 'Zippy'.
						xul label value: 'Male'.
						xul label value: 'Orange'.
						xul label value: 'Playful'.].
					xul row with: [
						xul label value: 'Zippy'.
						xul label value: 'Male'.
						xul label value: 'Orange'.
						xul label value: 'Playful'.].
					].
				]
			].
		
		xul groupbox with: [
			xul caption label: 'data in the columns'.
			
			xul grid with: [
				xul rows with: [
					xul row.
					xul row.
					xul row.
					xul row.].
				xul columns with: [
					xul column flex: 1; with: [
						xul button label: 'Name'.
						xul button label: 'Sex'.
						xul button label: 'Color'.
						xul button label: 'Description'.].
					xul column flex: 1; with: [
						xul label value: 'Pearl'.
						xul label value: 'Female'.
						xul label value: 'Gray'.
						xul label value: 'Frumpy'.].
					xul column flex: 1; with: [
						xul label value: 'Aramis'.
						xul label value: 'Male'.
						xul label value: 'Black'.
						xul label value: 'Cute'.].
					xul column flex: 1; with: [
						xul label value: 'Yakima'.
						xul label value: 'Male'.
						xul label value: 'Holstein'.
						xul label value: 'Handsome'.].
					xul column flex: 1; with: [
						xul label value: 'Cosmo'.
						xul label value: 'Female'.
						xul label value: 'White'.
						xul label value: 'Round'.].
					xul column flex: 1; with: [
						xul label value: 'Fergus'.
						xul label value: 'Male'.
						xul label value: 'Black'.
						xul label value: 'Long'.].
					xul column flex: 1; with: [
						xul label value: 'Clint'.
						xul label value: 'Male'.
						xul label value: 'Black'.
						xul label value: 'Young'.].
					xul column flex: 1; with: [
						xul label value: 'Tribble'.
						xul label value: 'Female'.
						xul label value: 'Orange'.
						xul label value: 'Frumpy'.].
					xul column flex: 1; with: [
						xul label value: 'Zippy'.
						xul label value: 'Male'.
						xul label value: 'Orange'.
						xul label value: 'Playful'.].
					].
				]
			]
	]