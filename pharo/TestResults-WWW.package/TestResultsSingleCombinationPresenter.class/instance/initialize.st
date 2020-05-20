initialization
initialize 
	super initialize.
	mode := 'NETTO'.
	graphComponent := TestResultsSingleCombinationGraph new onAnswer: [ :reqSet | self row: (Array with: reqSet asRequirements) ]; yourself.