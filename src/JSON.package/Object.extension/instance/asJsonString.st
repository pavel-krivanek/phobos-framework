*JSON
asJsonString

	^ String streamContents: [:str |
		self jsonWriteOn: str ]