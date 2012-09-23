as yet unclassified
renderFlexinesOn: xul

		xul groupbox with: [
			xul caption label: 'flexiness'.
			xul hbox with: [
				xul button label: 'No Flex'.
				xul button label: 'No Flex'.
				xul button label: 'No Flex'.
				xul button label: 'No Flex'.
				xul button label: 'No Flex'.].
			xul hbox with: [
				xul button label: 'There''s a'.
				xul button label: 'spacer'.
				xul spacer flex: 1.
				xul button label: 'in the'.
				xul button label: 'middle'.].
			xul hbox with: [
				xul button label: 'This spacer ->'.
				xul spacer flex: 2.
				xul button label: 'is bigger than this spacer, ->'.
				xul spacer flex: 1.
				xul button label: 'so there!!'.].
			xul hbox with: [
				xul button label: 'No Flex'.
				xul button label: 'No Flex'.
				xul button flex: 1; label: 'flex=1'.
				xul button label: 'No Flex'.
				xul button label: 'No Flex'.].
			xul hbox with: [
				xul button flex: 1; label: 'flex=1'.
				xul button flex: 2; label: 'flex=2'.
				xul button flex: 3; label: 'flex=3'.
				xul button flex: 4; label: 'flex=4'.
				xul button flex: 5; label: 'flex=5'.].
			xul hbox with: [
				xul button flex: 1; label: 'flex=1'.
				xul button flex: 1; label: 'flex=1'.
				xul button flex: 1; label: 'flex=1'.
				xul button flex: 1; label: 'flex=1'.
				xul button flex: 1; label: 'flex=1'.].
			].