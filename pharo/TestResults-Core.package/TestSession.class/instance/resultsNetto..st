selecting
resultsNetto: combination
	"Selects all test results having exactly specified combination (NETTO mode)"
	| set |
	set := combination asSet.
	^ testResults select: [ :res | res test requirements = set ]
	

