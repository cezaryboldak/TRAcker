calculation
TCFailCount: combination
	"Return quantity of test results that failed with a given requirement combination"
	^ (self resultsNetto: combination) count: self failedTestSelectionBlock 
	