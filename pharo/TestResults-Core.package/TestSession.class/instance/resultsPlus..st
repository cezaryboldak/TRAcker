selecting
resultsPlus: combination
	"Selects all test results having given requirement combination plus something else (PLUS mode)"
	| set |
	set := combination asSet.
	^ testResults select: [ :res | (res test requirements intersection: set) = set and: [ res test requirements size > set size ]  ]
	

