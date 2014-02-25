postload
postloadMacOS

	| c fs prefs exec app contents |
	 
	fs := FileSystem disk.
	
	contents := ZnClient new
		beOneShot;
		url: 'https://ci.inria.fr/pharo-contribution/view/Phobos/job/Phobos-git/lastSuccessfulBuild/artifact/template-mac.zip';
		get.
	
	ZipArchive new 
		readFrom: contents readStream;
		extractAllTo: FileSystem disk workingDirectory.
		
[ :bar |
  [
    ZnClient new
      url: 'http://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/20.0.1/runtimes/xulrunner-20.0.1.en-US.mac.tar.bz2';
      signalProgress: true;
      downloadTo: 'xulrunner.tar.bz2' ]
        on: HTTPProgress
        do: [ :progress |
                bar label: progress printString.
                progress isEmpty ifFalse: [ bar current: progress percentage ].
                progress resume ] ]
asJob run. 
	
	fs ensureCreateDirectory: fs workingDirectory / 'PhobosDemo.app'.
	
	(fs workingDirectory / 'template-mac' / 'PhobosDemo.app' ) copyAllTo: (fs workingDirectory /  'PhobosDemo.app').
	
	c := PipeableOSProcess command: 'cd PhobosDemo.app/Contents; mkdir Frameworks; cd Frameworks; tar -jxvf ../../../xulrunner.tar.bz2'.
	(c output; succeeded)
		ifFalse: [ self error: 'decompression error: ', c errorPipelineContents printString].
		
	contents := ZnClient new
		beOneShot;
		url: 'https://ci.inria.fr/pharo-contribution/view/Phobos/job/Phobos-git/lastSuccessfulBuild/artifact/content.zip';
		get.
	
	ZipArchive new 
		readFrom: contents readStream;
		extractAllTo: (fs workingDirectory /  'PhobosDemo.app' / 'Contents' /  'Resources' /  'chrome').
	
	prefs :=  (fs workingDirectory /  'PhobosDemo.app' / 'Contents' /  'Resources' / 'defaults' / 'preferences' / 'prefs.js').

	prefs writeStream nextPutAll: (prefs readStream contents copyReplaceAll: 'chrome://myapp/content/splash/splash.xul' with: 'chrome://myapp/content/templates/main.xul').

	c := PipeableOSProcess command: 'chmod -R 755 PhobosDemo.app'.
	(c output; succeeded)
		ifFalse: [ self error: 'chmod error: ', c errorPipelineContents printString].
		
	app := PhobosDemo new.
	app start.

	exec :=  'open PhobosDemo.app'.
	c := OSProcess command:  exec.