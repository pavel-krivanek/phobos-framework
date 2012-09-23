as yet unclassified
renderAlignmentOn: xul

		xul groupbox with: [
			xul caption label: 'alignment'.
			
			xul hbox align: 'start'; with: [
				xul button label: 'Here'; 
					image: self imageUrl; 
					orient: 'vertical'.
				xul button orient: 'vertical'; with: [
					xul label value: 'the'.
					xul label value: 'alignment'.].
				xul button label: 'is'; image: self imageUrl.
				xul button label: 'start'.].
			
			xul hbox align: 'center'; with: [
				xul button label: 'Here'; 
					image: self imageUrl; 
					orient: 'vertical'.
				xul button orient: 'vertical'; with: [
					xul label value: 'the'.
					xul label value: 'alignment'.].
				xul button label: 'is'; image: self imageUrl.
				xul button label: 'center'.].
			
			xul hbox align: 'end'; with: [
				xul button label: 'Here'; 
					image: self imageUrl; 
					orient: 'vertical'.
				xul button orient: 'vertical'; with: [
					xul label value: 'the'.
					xul label value: 'alignment'.].
				xul button label: 'is'; image: self imageUrl.
				xul button label: 'end'.].
			
			xul hbox align: 'baseline'; with: [
				xul button label: 'Here'; 
					image: self imageUrl; 
					orient: 'vertical'.
				xul button orient: 'vertical'; with: [
					xul label value: 'the'.
					xul label value: 'alignment'.].
				xul button label: 'is'; image: self imageUrl.
				xul button label: 'baseline'.].
			
			xul hbox align: 'stretch'; with: [
				xul button label: 'Here'; 
					image: self imageUrl; 
					orient: 'vertical'.
				xul button orient: 'vertical'; with: [
					xul label value: 'the'.
					xul label value: 'alignment'.].
				xul button label: 'is'; image: self imageUrl.
				xul button label: 'stretch'.].

	]