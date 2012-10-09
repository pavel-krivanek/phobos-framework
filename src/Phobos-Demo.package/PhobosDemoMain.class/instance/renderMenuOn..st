as yet unclassified
renderMenuOn: xul

	xul toolbox with: [
		xul menubar with: [
			xul menu label: 'File'; accesskey: 'f'; with: [
				xul menupopup with: [
					xul menuitem label: 'print...'; oncommand: [self printExample].

					xul menuitem label: 'Print setup...'; oncommand: 'printing.utils.showPageSetup()'.
					xul menuitem label: 'JavaScript console'; oncommand: ['window.open("chrome://global/content/console.xul","_blank","chrome");'].
					xul menuitem label: 'Open...'; oncommand: [self openNextWindowOn: xul].
					xul menuitem label: 'Parent window'; oncommand: ['alert(window.parentWindow)'].
					xul menuitem label: 'Related windows'; oncommand: ['alert(window.relatedWindows)'].
					xul menuitem label: 'Exit'; oncommand: 'window.close()']]]].
