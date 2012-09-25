as yet unclassified
finishRendering

" 	| getCellText getCellValue |
	
	getCellText := [:msg | 
		| row col |
		row := msg argument first. 
		col := msg argument second. 
		row asString].
	getCellValue := getCellText.

		 getCellText: function(row,column){ return runClosure(''', (self registerClosure: getCellText), ''', [row, column.element.getAttribute(''id'')]) },  "	

	self evaluateJS: ('window.document.getElementById("', tree id, '").view={
  		 rowCount: ', self rowsCount asString, ',
  		 getCellText: function(row,column){ if (column.element.getAttribute(''id'') == "', numCol id, '") return row+1; else return "some text" },  
  		 getCellValue: function(row,column){ if (column.element.getAttribute(''id'') == "', numCol id, '") return row+1; else return "some text" },  
  		 setTree: function(aTreeBox){ self.treebox = aTreeBox; },  
  		 isContainer: function(row){ return false; },  
  		 isSeparator: function(row){ return false; },  
  		 isSorted: function(){ return false; },  
  		 getLevel: function(row){ return 0; },  
  		 getImageSrc: function(row,col){ return "https://sites.google.com/a/wvde.k12.wv.us/oaar-file-cabinet/system/app/pagetypes/filecabinet/icon-folder.gif"; },  
  		 getRowProperties: function(row,props){},  
  		 getCellProperties: function(row,col,props){},  
  		 getColumnProperties: function(colid,col,props){}  
 	 }')