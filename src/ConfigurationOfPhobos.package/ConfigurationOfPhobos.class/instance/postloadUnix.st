postload
postloadUnix

	| c fs prefs exec app  |
	 
	c := PipeableOSProcess command: self gitRepository.
	(c output; succeeded)
		ifFalse: [ self error: 'Git error: ', c errorPipelineContents printString].
		
	fs := FileSystem disk.

	fs ensureCreateDirectory: fs workingDirectory / self appName.
	(fs workingDirectory / 'phobos-framework' / 'template-linux' / 'PhobosDemo' ) copyAllTo: (fs workingDirectory / self appName).
	fs ensureCreateDirectory: fs workingDirectory / self appName / 'chrome' / 'content'.
	(fs workingDirectory / 'phobos-framework' / 'content' ) copyAllTo: (fs workingDirectory / self appName / 'chrome' / 'content').

	prefs :=  (fs workingDirectory / self appName / 'defaults' / 'preferences' / 'prefs.js').

	prefs writeStream nextPutAll: (prefs readStream contents copyReplaceAll: 'chrome://myapp/content/splash/splash.xul' with: 'chrome://myapp/content/templates/main.xul').

	app := PhobosDemo new.
	app start.

	exec :=  './', self appName, '/', self appName, '.sh'.  
	c := PipeableOSProcess command: 'chmod +x ', exec. 
	(c output; succeeded)
		ifFalse: [ self error: 'chmod error: ', c errorPipelineContents printString].

	c := OSProcess command:  exec.