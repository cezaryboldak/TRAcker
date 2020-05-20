calculation
TCPlusPassCount: combination
	"Return quantity of test results that passed with a given requirement combination plus something"
	^ (self resultsPlus: combination) count: self passedTestSelectionBlock 
	