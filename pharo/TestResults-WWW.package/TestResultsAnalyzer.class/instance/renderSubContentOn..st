rendering
renderSubContentOn: html
	| testSession headers |
	
	testSession := self session testSession. 
	html mdlCell size: 12; with: [ html heading level: 3; with: 'Test results for ', testSession description ].
	html mdlCell size: 12; with: [  
		html text: 'Number of all test cases: ', testSession allTestResults size greaseString, ' '. 
		html anchor  callback: [ self call: ( TestResultsSomeTestCases new testResults: (testSession testResults); title: 'Total'; yourself ) ]; with: 'See all of them ...' ].
	
	html mdlCell size: 12; with: [ self renderCombinationsOn: html ]	.

	html mdlCell size: 12; with: [ self renderRequirementFilteringOn: html ].  

	headers := {#TCNeeded->'#TCNeeded'. #TCCount->'#TC'. #TestCoverage->'TestCoverage'. #TCFailCount->'#TCFail'. #TCPassCount->'#TCPass'. #Reliability->'Rel'. #DBR->'DBR'. #DFE->'DFE'. #DSI->'DSI'. #DFOrder->'DFOrder' }.
	html mdlCell size: 12; with: [ self renderResultTableOn: html with: headers ].

	"html mdlCell size: 12; with: [ self renderStatisticsOn: html ]."