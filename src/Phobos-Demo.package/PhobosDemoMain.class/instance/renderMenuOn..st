as yet unclassified
renderMenuOn: xml

	xml toolbox with: [
		xml menubar with: [
			xml menu label: 'File'; accesskey: 'f'; with: [
				xml menupopup with: [
					xml menuitem label: 'print...'; oncommand: ['window.open("chrome://global/content/printPageSetup.xul","_blank","chrome");'].
					xml menuitem label: 'JavaScript console'; oncommand: ['window.open("chrome://global/content/console.xul","_blank","chrome");'].
					xml menuitem label: 'Open...'; oncommand: ["self openNextWindowOn: xml"].
					xml menuitem label: 'Parent window'; oncommand: ['alert(window.parentWindow)'].
					xml menuitem label: 'Related windows'; oncommand: ['alert(window.relatedWindows)'].
					xml menuitem label: 'Exit'; oncommand: ['window.close()']]]]].
