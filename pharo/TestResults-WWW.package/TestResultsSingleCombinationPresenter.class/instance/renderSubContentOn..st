rendering
renderSubContentOn: html 
	| reqSet testResults |
	
	((row at: 1) = '{.}') ifTrue: [ row at:1 put: '{}' ].
	html mdlCell size: 12; with: [ html heading level: 2; with: 'Configuration ',(row at: 1) ].
	reqSet := Set fromString: (row at: 1).
	testResults := self selectTestResultsFor: reqSet.
	
	html mdlCell size: 12; with: [ self renderInfoForReq: reqSet  on: html ].
	
	html mdlCell size: 12; with: [ self renderGraphComponentInfoOn: html ].
	graphComponent reqSet: reqSet.
	
	html mdlCell size: 12; with: [ html render: graphComponent ].
	
	html mdlCell size: 12; with: [ self renderTestCasesTableInfoOn: html ].
	html mdlCell size: 12; with: [ self renderModeTabsForConfiguration: reqSet with: testResults on: html ].
	
	html mdlCell size: 12; with: [ self renderTestCasesTableForConfiguration: reqSet with: testResults on: html ]. 

	html break. html break.
	html mdlCell size:12; with: [ html mdlAnchorButton accentColor; raised; rippleEffect; callback: [ self answer ]; with: 'Close' ]
