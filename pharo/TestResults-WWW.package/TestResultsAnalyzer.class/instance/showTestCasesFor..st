delegation
showTestCasesFor: row
	self call: (TestResultsSingleCombinationPresenter new row: row).
	
