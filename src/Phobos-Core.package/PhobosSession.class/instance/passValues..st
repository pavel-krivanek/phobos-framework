as yet unclassified
passValues: message

	message argument do: [:handler |
		 (closures at: (handler at: #callback)) value: (handler at: #value)].
		
	(closures at: message target) cull: message.

	