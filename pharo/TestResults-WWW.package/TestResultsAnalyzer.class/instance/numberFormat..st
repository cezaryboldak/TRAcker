styling
numberFormat: number
   | str |
	str := (number asFloat roundTo: 0.001) asString.
	(str includesSubstring: '.') ifFalse: [ ^ number ] ifTrue: [   ^ (str copyFrom: 1 to: (((str indexOf: '.')+5) min: str size)) asNumber  ]