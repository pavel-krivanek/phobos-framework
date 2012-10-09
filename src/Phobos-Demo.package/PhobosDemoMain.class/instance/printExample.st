as yet unclassified
printExample

	| html | 
	
	html := PhobosHTMLCanvas for: self.
	
	html h1 with: 'List of Phobos demos'.
	html table with: [
		html tr with: [ html th with: 'demo name'. html th with: 'class'].
		self pages do: [:pageInfo |
			html tr with: [
				html td with: pageInfo key asString.
				html td with: pageInfo value asString.]]].
	html rawXml: PhobosDemoImages new svgImage.
	
	html print.

