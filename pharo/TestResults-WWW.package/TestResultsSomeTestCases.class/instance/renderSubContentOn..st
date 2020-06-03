rendering
renderSubContentOn: html 
	html mdlGrid: [ html mdlCell size: 12; with: [ 
	html paragraph: 'Double click to see answers'.
	html table: [ html tableRow: [ html tableData class: 'failed'; with: 'test case failed'.  html tableData class: 'passed'; with: 'test case passed' ] ] .
	html mdlTable
		shadow: 2; style: 'width: 100%;';
		with: [ 
			html tableHead: [ 
				html mdlTableHeading with: 'Nr'. html mdlTableHeading nonNumerical; with: 'Test text'. html mdlTableHeading nonNumerical; with: 'Status'. html mdlTableHeading: 'Answer size'.				
			 ].
			html tableBody: [ 
				testResults do: [ :testResult | | anId | 
				 	anId := html nextId. 
					html tableRow id: anId; class: 'passed' if: (testResult result = #OK); class: 'failed' if: (testResult result ~= #OK); 
						onDoubleClick: 'document.location=$("#',anId asString,'")[0].href' ; 
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
