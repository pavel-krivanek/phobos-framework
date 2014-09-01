as yet unclassified
renderMenuOn: xul

	xul toolbox with: [
		xul menubar with: [
			xul menu label: 'File'; accesskey: 'f'; with: [
				xul menupopup with: [
					xul menuitem label: 'Open...'; oncommand: [self openFile].
					xul menuseparator.
					xul menuitem label: 'Print...'; oncommand: [self printExample].
					xul menuitem label: 'Print setup...'; oncommand: 'printing.utils.showPageSetup()'.
					xul menuitem label: 'New window...'; oncommand: [self openNextWindow].
					xul menuitem label: 'Exit'; oncommand: 'window.close()']]]].
