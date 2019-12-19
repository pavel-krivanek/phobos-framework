as yet unclassified
initialize
	"Json initialize."
	
	escapeArray := (1 to: 128) collect: [:i | Character value: i-1].

	(0 to: 31), #(127) do: [ :each |
		escapeArray at: each + 1 put: '\u', (each printStringHex padLeftTo: 4 with: $0) ].
	{
		$" -> '\"'.
		$\ -> '\\'.
		Character backspace -> '\b'.
		Character lf -> '\n'.
		Character newPage -> '\f'.
		Character cr -> '\r'.
		Character tab -> '\t'.
	} do: [ :each |
		escapeArray at: each key asciiValue + 1 put: each value ].
