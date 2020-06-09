rendering
renderSubContentOn: html
	| testSession headers |
	
	testSession := self session testSession. 
	html heading: 'Test results for ', testSession description.
	html paragraph with: [ 
		html text: 'Number of all test cases: ', testSession allTestResults size greaseString, ' '. 
		html anchor  callback: [ self call: ( TestResultsSomeTestCases new testResults: (testSession testResults); title: 'Total'; yourself ) ]; with: 'See all of them ...' ].
	html paragraph: 'Number of not excluded test cases: ', testSession testResults size greaseString .
	self renderCombinationsOn: html.
	html break.
	self renderRequirementFilteringOn: html.  
	html break.
	headers := {#TCNeeded->'#TCNeeded'. #TCCount->'#TC'. #TestCoverage->'TestCoverage'. #TCFailCount->'#TCFail'. #TCPassCount->'#TCPass'. #Reliability->'Rel'. #DBR->'DBR'. #DFE->'DFE'. #DSI->'DSI'. #DFOrder->'DFOrder' }.
	self renderResultTableOn: html with: headers.

	self renderStatisticsOn: html.