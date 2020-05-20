calculation
TCFail: combination
	"Return test results that failed with a given requirement combination"
	^ (self resultsNetto: combination) select: self failedTestSelectionBlock 
	