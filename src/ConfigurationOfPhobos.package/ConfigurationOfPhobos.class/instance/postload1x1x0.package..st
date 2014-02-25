postload
postload1x1x0: loader package: packageSpec

	Smalltalk isHeadless ifFalse: [ 
		(UIManager confirm: 'Do you want to start PhobosDemo application?')
			ifTrue: [
					Smalltalk os isUnix ifTrue: [ self postloadUnix ].
					Smalltalk os isWindows ifTrue: [ self postloadWindows ].
					Smalltalk os isMacOSX ifTrue: [ self postloadMacOS ] ] ].

