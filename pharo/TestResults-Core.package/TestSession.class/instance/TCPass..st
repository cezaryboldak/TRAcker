calculation
TCPass: combination
	"Return test results that passed with a given requirement combination"
	^ (self resultsNetto: combination) select: self passedTestSelectionBlock 
	