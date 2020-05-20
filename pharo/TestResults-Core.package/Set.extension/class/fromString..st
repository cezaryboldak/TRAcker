*TestResults-Core
fromString: aString
	"construct a new set from a string formated '{r1,r2}"
	| req |
	((aString = '{}') | (aString = '{.}'))
		ifTrue: [ req := self new.  ]
		ifFalse: [ 
			req := (aString copyFrom:2 to: (aString size - 1)) splitOn: ','.
			req := (req collect: [ :str | str asSymbol ]) asSet.
		].
	
	^ req