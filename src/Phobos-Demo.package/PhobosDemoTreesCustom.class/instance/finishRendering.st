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

	self evaluateJS: ('phobos.getWindow("', self window asString, '").document.getElementById("', tree id, '").view={
  		 rowCount: ', self rowsCount asString, ',
  		 getCellText: function(row,column){ if (column.element.getAttribute(''id'') == "', numCol id, '") return row+1; else return "some text" },  
  		 getCellValue: function(row,column){ if (column.element.getAttribute(''id'') == "', numCol id, '") return row+1; else return "some text" },  
  		 setTree: function(aTreeBox){ self.treebox = aTreeBox; },  
  		 isContainer: function(row){ return false; },  
  		 isSeparator: function(row){ return false; },  
  		 isSorted: function(){ return false; },  
  		 getLevel: function(row){ return 0; },  
  		 getImageSrc: function(row,col){
			 if (col.element.getAttribute(''id'') == "', textCol1 id, '") return "', self session baseURI, 'images/icon-folder.gif"; else return null },  
  		 getRowProperties: function(row,props){},  
  		 getCellProperties: function(row,col,props){},  
  		 getColumnProperties: function(colid,col,props){}  
 	 }')