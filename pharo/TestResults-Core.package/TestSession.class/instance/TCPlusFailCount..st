calculation
TCPlusFailCount: combination
	"Return quantity of test results that failed with a given requirement combination pls something"
	^ (self resultsPlus: combination) count: self failedTestSelectionBlock 
	