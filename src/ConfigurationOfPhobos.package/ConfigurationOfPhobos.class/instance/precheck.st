postload
precheck

	| c | 
	
	"check git"
	c := PipeableOSProcess command: 'git --version' .
	(c output; succeeded) ifFalse: [ self error: 'git not installed.' ].

	"check xulrunner"
	c := PipeableOSProcess command: 'xulrunner -v' .
	(c output; succeeded) ifFalse: [ self error: 'git not installed.' ].
