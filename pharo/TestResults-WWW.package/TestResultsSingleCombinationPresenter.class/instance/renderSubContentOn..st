rendering
renderSubContentOn: html 
	| reqSet testResults |
	
	((row at: 1) = '{.}') ifTrue: [ row at:1 put: '{}' ].
	html heading: 'Configuration ',(row at: 1).
	reqSet := Set fromString: (row at: 1).
	testResults := self selectTestResultsFor: reqSet.
	
	self renderInfoForReq: reqSet  on: html.
	
	self renderGraphComponentInfoOn: html.
	graphComponent reqSet: reqSet.
	html render: graphComponent .
	
	self renderTestCasesTableInfoOn: html.
	self renderModeTabsForConfiguration: reqSet with: testResults on: html.
	
	self renderTestCasesTableForConfiguration: reqSet with: testResults on: html. 

	html break. html break.
	html div: [ html mdlAnchorButton accentColor; raised; rippleEffect; callback: [ self answer ]; with: 'Close' ]
