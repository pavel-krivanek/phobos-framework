postload
postloadWindows

	| c fs prefs exec app contents |
	 
	fs := FileSystem disk.
	
	contents := ZnClient new
		beOneShot;
		url: 'https://ci.inria.fr/pharo-contribution/view/Phobos/job/Phobos-git/lastSuccessfulBuild/artifact/template-win.zip';
		get.
	
	ZipArchive new 
		readFrom: contents readStream;
		extractAllTo: FileSystem disk workingDirectory.
		
	UIManager default informUser: 'Downloading XULRunner. Please wait, this progress bar is not showing real progress ;-)' during: [  
		ZnClient new
			url: 'http://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/27.0/runtimes/xulrunner-27.0.en-US.win32.zip';
			downloadTo: 'xulrunner.zip'.
	].	
	ZipArchive new 
		readFrom:  FileSystem disk workingDirectory / 'xulrunner.zip';
		extractAllTo: FileSystem disk workingDirectory.

	fs ensureCreateDirectory: fs workingDirectory / self appName.
	
	(fs workingDirectory / 'template-win' / 'PhobosDemo' ) copyAllTo: (fs workingDirectory / self appName).
	
	contents := ZnClient new
		beOneShot;
		url: 'https://ci.inria.fr/pharo-contribution/view/Phobos/job/Phobos-git/lastSuccessfulBuild/artifact/content.zip';
		get.
	
	ZipArchive new 
		readFrom: contents readStream;
		extractAllTo: (fs workingDirectory / self appName / 'chrome').
	
	prefs :=  (fs workingDirectory / self appName / 'defaults' / 'preferences' / 'prefs.js').

	prefs writeStream nextPutAll: (prefs readStream contents copyReplaceAll: 'chrome://myapp/content/splash/splash.xul' with: 'chrome://myapp/content/templates/main.xul').

	ZipArchive new 
		readFrom:  FileSystem disk workingDirectory / 'xulrunner.zip';
		extractAllTo: FileSystem disk workingDirectory /  self appName .
		
	(FileSystem disk workingDirectory /  self appName / 'xulrunner' / 'xulrunner-stub.exe') copyTo: (FileSystem disk workingDirectory /  self appName / 'PhobosDemo.exe').
	
	app := PhobosDemo new.
	app start.

	exec :=  './', self appName, '/PhobosDemo.exe'.
	c := OSProcess command:  exec.