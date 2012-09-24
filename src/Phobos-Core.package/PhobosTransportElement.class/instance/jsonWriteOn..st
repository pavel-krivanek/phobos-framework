JSON
jsonWriteOn: s

	(Dictionary newFrom: {
		#namespace -> namespace.
		#prefix -> prefix.
		#tagName -> tagName.
		#attributes -> attributes.
		#text -> text.
		#children -> children.
		}) jsonWriteOn: s
	