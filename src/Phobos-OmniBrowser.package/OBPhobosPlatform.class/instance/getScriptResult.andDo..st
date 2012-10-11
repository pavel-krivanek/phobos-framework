as yet unclassified
getScriptResult: aJavaScript andDo: aResultBlock 

	"aJavaScript must be single instruction and must not be ended with a semicolon"

"	| operations ajax canvas continuation answer |

	operations := XULCurrentOperations value contents.
	canvas := XULCurrentResponseCanvas value contents currentCanvas.
	continuation := WAValueHolder new.
		
	ajax := canvas ajax
		callback: [
			| param result cont |
	
			XULCurrentResponseCanvas value contents isCurrent ifFalse: [
				XULCurrentResponseCanvas value contents resetResponse].

			param := WACurrentSession value currentRequest fields at: '_param1'.
			result := aResultBlock value: param.
			cont := Continuation new.
			[:cc | continuation contents 
				value: {result. XULCurrentResponseCanvas value contents currentCanvas. cont}] 
					value: (cont initializeFromContext: thisContext sender).] fixTemps .

	ajax parameters at: '_param1' put: aJavaScript..	
		
	operations add: (XULEvaluateJavaScript new
			script: ajax script; 
			yourself).
	
	answer := Continuation currentDo: [ :cc | 
		continuation contents: cc.
		XULDelegationNotification new signal.
	] fixTemps.

	canvas renderContinuation: answer third.
	canvas currentCanvas: answer second.	
	XULCurrentOperations value contents:  answer second context document operations.

	^ answer first.
	"