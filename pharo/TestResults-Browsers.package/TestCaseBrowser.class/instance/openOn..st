initialization
openOn: aSession
	session := aSession.
	tests := aSession tests.
	testResults := aSession testResults.
	browser := self createBrowser.
	
	browser openOn: testResults.