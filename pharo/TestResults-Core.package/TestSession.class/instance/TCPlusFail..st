calculation
TCPlusFail: combination
	"Return test results that failed with a given requirement combination plus something"
	^ (self resultsPlus: combination) select: self failedTestSelectionBlock 
	