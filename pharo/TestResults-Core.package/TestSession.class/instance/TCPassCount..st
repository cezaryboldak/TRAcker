calculation
TCPassCount: combination
	"Return quantity of test results that passed with a given requirement combination"
	^ (self resultsNetto: combination) count: self passedTestSelectionBlock 
	