as yet unclassified
renderMenu: aMenu on: xul

	aMenu items do: [:item |
		self renderMenuItem: item on: xul]

	