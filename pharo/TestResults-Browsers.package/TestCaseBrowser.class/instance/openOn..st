initialization
openOn: aSession
	session := aSession.
	tests := aSession testResults collect: [ :result | result test ].
	testResults := aSession testResults.
	browser := self createBrowser.
	
	browser openOn: testResults.