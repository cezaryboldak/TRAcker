selecting
resultsNetto: combination
	"Selects all test results having exactly specified combination (NETTO mode)"
	| set |
	set := combination asSet.
	^ self testResults select: [ :res | res test requirements = set ]
	

