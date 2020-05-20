rendering
renderSubContentOn: html
	| testSession headers |
	
	testSession := self session testSession. 
	html heading: 'Test results for ', testSession description.
	html paragraph: 'Number of test cases: ', testSession tests size greaseString .
	self renderCombinationsOn: html.
	html break.
	self renderRequirementFilteringOn: html.  
	html break.
	headers := {#TCNeeded->'#TCNeeded'. #TCCount->'#TC'. #TestCoverage->'TestCoverage'. #TCFailCount->'#TCFail'. #TCPassCount->'#TCPass'. #Reliability->'Rel'. #DBR->'DBR'. #DFE->'DFE'. #DSI->'DSI'. #DFOrder->'DFOrder' }.
	self renderResultTableOn: html with: headers
