as yet unclassified
renderEqualityOn: xul

		xul groupbox orient: 'horizontal'; with: [
			xul caption label: 'euality'.
			
			xul vbox equalsize: 'always'; with: [
				xul button label: 'Here'; 
					image: self imageUrl; 
					orient: 'vertical'.
				xul button orient: 'vertical'; with: [
					xul label value: 'the'.
					xul label value: 'equalsize'.
					xul label value: 'attribute'.].
				xul button label: 'is'; image: self imageUrl.
				xul button label: 'always'.].
			
			xul vbox equalsize: 'never'; with: [
				xul button label: 'Here'; 
					image: self imageUrl; 
					orient: 'vertical'.
				xul button orient: 'vertical'; with: [
					xul label value: 'the'.
					xul label value: 'equalsize'.
					xul label value: 'attribute'.].
				xul button label: 'is'; image: self imageUrl.
				xul button label: 'never'.].
	]