rendering
renderSubContentOn: html 
	| id classesToDesc |
	html heading level1; with: [ html text: 'Tests '. title ifNotNil: [ html small: title ] ].
	html heading level5; with: [ html text: 'Number of tests: '. html span id: 'testNumber'; with: testResults size greaseString ].
	self renderRequirementFilteringOn: html.
	html heading level5; with: [ html text: 'Test results fitlering'. html small: ' (click to hide/show)'].
	classesToDesc := OrderedDictionary newFrom: { 'ok'->'test case passed (OK)'. 'failed'->'test case failed'. 'exception'->'exception'. 'timeout'->'timeout'.'crash'->'crash'.'unknown'->'result unknown' } .
	html mdlGrid: [ html mdlCell size: 12; with: [ 
	html table: [ html tableRow: [ 
			classesToDesc keysAndValuesDo: [ :cl :desc | 
				id := html nextId.
				html tableData id: id; class: cl; onClick: (html jQuery script: [ :s | s << ((s jQuery id: id asString) hasClass: cl) then: ((s jQuery: 'tr.',cl) addClass: cl,'-hidden') else:  ((s jQuery: 'tr.',cl) removeClass: cl,'-hidden'). s << ((s jQuery id: id asString) hasClass: cl) then: ((s jQuery id: id asString) removeClass: cl) else:  ((s jQuery id: id asString) addClass: cl).  s << (JSStream on: 'updateVisibleTests();') ]); with: desc.  
			]
 	] ] .
	html heading level5 with: [ html text: 'Test cases list'. html small: ' (Double click to see answers)' ].
	html mdlTable
		shadow: 2; style: 'width: 100%;';
		with: [ 
			html tableHead: [ 
				html mdlTableHeading with: 'Nr'. html mdlTableHeading nonNumerical; with: 'Test text'. html mdlTableHeading nonNumerical; with: 'Status'. html mdlTableHeading: 'Answer size'.				
			 ].
			html tableBody: [ 
				testResults do: [ :testResult | | anId row | 
				 	anId := html nextId. 
					row := html tableRow.
					row id: anId; class: testResult label asLowercase; class: 'test-case';
						onDoubleClick: 'document.location=$("#',anId asString,'")[0].href'.
					testResult test requirements do: [ :req | row class: req greaseString ].
					row 
					with: [ 
						html anchor callback: [ self call: (TestResultsSingleTestCasePresenter new testCaseNumber: testResult test number) ]; style: 'display:none'; id: anId.
						html mdlTableCell: testResult test number.
						html mdlTableCell nonNumerical; with: testResult test text.
						html mdlTableCell nonNumerical; with: testResult message.
						html mdlTableCell: testResult test answerSize.
					]
				]
			]
		].
 ] ]. 
	html div: [ html mdlAnchorButton accentColor; raised; rippleEffect; callback: [ self answer ]; with: 'Close' ]
