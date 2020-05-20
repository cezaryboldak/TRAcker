styling
numberFormat: number
   | str |
	number ifNil: [ ^ nil ].
	str := (number asFloat roundTo: 0.001) greaseString.
	(str includesSubstring: '.') ifFalse: [ ^ number ] ifTrue: [   ^ (str copyFrom: 1 to: (((str indexOf: '.')+5) min: str size)) asNumber  ]