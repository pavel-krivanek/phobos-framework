accessing
jsonWriteOn: s
	
	^ (Dictionary newFrom: {
		#sessionId -> sessionId.
		#type -> type.
		#target -> target.
		#content -> content.
		#window -> window.
		#argument -> argument.
		}) jsonWriteOn: s
	
															
