as yet unclassified
numbersMayContain: aChar
	^ aChar isDigit or: [#($- $+ $. $e $E) includes: aChar]