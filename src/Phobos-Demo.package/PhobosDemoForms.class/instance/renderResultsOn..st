as yet unclassified
renderResultsOn: xul

	xul groupbox flex: 1; with: [
		xul caption label: 'result'.
		xul listbox flex: 1; with: [
			xul listhead with: [
				xul listheader label: 'property'.
				xul listheader label: 'value'.].
			xul listcols with: [
				xul listcol.
				xul listcol flex: 1.].
			xul listitem with: [
				xul listcell label: 'name'. xul listcell label: self name asString].
			xul listitem with: [
				xul listcell label: 'surname'. xul listcell label: self surname asString].
			xul listitem with: [
				xul listcell label: 'number 1'. xul listcell label: self number1 asString].
			xul listitem with: [
				xul listcell label: 'numer 2'. xul listcell label: self number2 asString].
			xul listitem with: [
				xul listcell label: 'scale'. xul listcell label: self scale asString].
			xul listitem with: [
				xul listcell label: 'password'. xul listcell label: self password asString].
			xul listitem with: [
				xul listcell label: 'remember me'. xul listcell label: self rememberMe asString].
			xul listitem with: [
				xul listcell label: 'color'. xul listcell label: self color asString].
			xul listitem with: [
				xul listcell label: 'date'. xul listcell label: self date asString].
			xul listitem with: [
				xul listcell label: 'gender'. xul listcell label: self gender asString].			
			xul listitem with: [
				xul listcell label: 'items'. xul listcell label: self items asString].			
	]]