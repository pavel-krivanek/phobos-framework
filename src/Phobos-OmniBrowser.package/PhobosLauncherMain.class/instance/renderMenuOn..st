as yet unclassified
renderMenuOn: xul

	xul toolbox with: [
		xul menubar with: [
			xul menu label: 'tools'; accesskey: 't'; with: [
				xul menupopup with: [
					xul menuitem label: 'open dialog'; oncommand: 'alert(openFileDialog())'.
					xul menuitem label: 'save dialog'; oncommand: 'alert(saveFileDialog())'.
					xul menuseparator.
					xul menuitem label: 'browser'; oncommand: [OBSystemBrowser open. ].
					xul menuitem label: 'process browser'; oncommand: [(Smalltalk at: #OTProcessBrowser) open]; disabled: (Smalltalk includesKey: #OTProcessBrowser) not.
					xul menuitem label: 'monticello'; oncommand: [(Smalltalk at: #MCPackageBrowser) open]; disabled: (Smalltalk includesKey: #MCAllRepositoryBrowser) not.	
					xul menuitem label: 'monticello repositories'; oncommand: [(Smalltalk at: #MCAllRepositoryBrowser) open]; disabled: (Smalltalk includesKey: #MCAllRepositoryBrowser) not.	
					xul menuitem label: 'inspect me'; oncommand: [(Smalltalk at: #OTInspector) openOn: self]; disabled: (Smalltalk includesKey: #OTInspector) not.				
					"xul menuitem label: 'debugger'; onCommand: (xul ajax callback: [(Smalltalk at: #OTDebugger) openProcess: ([3+4] newProcess)]); disabled: (Smalltalk includesKey: #OTDebugger) not.	"			
				]].
			xul menuseparator.
			xul menuitem label: 'browser'; oncommand: [OBSystemBrowser open].
		]].


