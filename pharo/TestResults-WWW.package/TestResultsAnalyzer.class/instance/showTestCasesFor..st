delegation
showTestCasesFor: row
   "save the table configuration"
   self position: (mdlTable position).
   self elementsToShow: (mdlTable elementsToShow).	
	self call: (TestResultsSingleCombinationPresenter new row: row).
	
