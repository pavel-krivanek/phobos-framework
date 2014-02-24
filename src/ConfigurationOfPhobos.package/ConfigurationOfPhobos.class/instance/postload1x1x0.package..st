postload
postload1x1x0: loader package: packageSpec

	(Smalltalk os isUnix and: [Smalltalk isHeadless not]) ifTrue: [ self postloadUnix ]