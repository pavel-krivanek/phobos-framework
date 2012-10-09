accessing
renderOn: aRenderer	
	
	"Do not override this methods on your component, override instead #renderContentOn:"
		
	self decorationChainDo: [ :each | each renderContentOn: aRenderer ]