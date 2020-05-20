calculation
TCPlusPass: combination
	"Return test results that passed with a given requirement combination plus something"
	^ (self resultsPlus: combination) select: self passedTestSelectionBlock 
	