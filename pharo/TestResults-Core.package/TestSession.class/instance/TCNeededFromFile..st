initializing
TCNeededFromFile: aFile 
	" constructs a dict mapping a requirement combination (set of symbols) to value TCNeeded from aFile (combination of requirement names comma- separated + tab  + TCNeeded value"
	| set lineReader line reqs collection value |

	TCNeededTable := Dictionary new.
		
	lineReader := ZnLineReader on: (ReadStream on: aFile rawContents).
	lineReader limit: 16777216.
	[ (line := lineReader nextLine trimBoth) isEmpty ]
		whileFalse: [ 
			collection := line splitOn: [ :each | each isSeparator  ].
			reqs := collection at: 1.
			value :=  (collection at: 2) asInteger.
			set := self stringToReqSet: reqs.
			TCNeededTable at: set put: value.
		].
   