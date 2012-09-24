accessing
jsonWriteOn: s

	(Dictionary newFrom: {
		#key -> key.
		#value -> value.
		}) jsonWriteOn: s
	