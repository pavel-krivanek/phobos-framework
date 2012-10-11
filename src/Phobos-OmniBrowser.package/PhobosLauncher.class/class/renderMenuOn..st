as yet unclassified
renderMenuOn: xul

	xul toolbox with: [
		xul menubar with: [
			xul menu label: 'tools'; accesskey: 't'; with: [
				xul menupopup with: [
					xul menuitem label: 'open dialog'; onCommand: 'alert(openFileDialog())'.
					xul menuitem label: 'save dialog'; onCommand: 'alert(saveFileDialog())'.
					xul menuseparator.
					xul menuitem label: 'browser'; onCommand: (xul ajax callback: [OBSystemBrowser open. ]).
					xul menuitem label: 'process browser'; onCommand: (xul ajax callback: [(Smalltalk at: #OTProcessBrowser) open]); disabled: (Smalltalk includesKey: #OTProcessBrowser) not.
					xul menuitem label: 'monticello'; onCommand: (xul ajax callback: [(Smalltalk at: #MCPackageBrowser) open]); disabled: (Smalltalk includesKey: #MCAllRepositoryBrowser) not.	
					xul menuitem label: 'monticello repositories'; onCommand: (xul ajax callback: [(Smalltalk at: #MCAllRepositoryBrowser) open]); disabled: (Smalltalk includesKey: #MCAllRepositoryBrowser) not.	
					xul menuitem label: 'inspect me'; onCommand: (xul ajax callback: [(Smalltalk at: #OTInspector) openOn: self]); disabled: (Smalltalk includesKey: #OTInspector) not.				
					"xul menuitem label: 'debugger'; onCommand: (xul ajax callback: [(Smalltalk at: #OTDebugger) openProcess: ([3+4] newProcess)]); disabled: (Smalltalk includesKey: #OTDebugger) not.	"			
				]].
			xul menuseparator.
			xul menuitem label: 'browser'; onCommand: (xul ajax callback: [OBSystemBrowser open]).
		]].


