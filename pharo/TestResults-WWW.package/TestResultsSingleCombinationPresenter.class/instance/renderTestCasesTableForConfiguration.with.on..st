rendering
renderTestCasesTableForConfiguration: reqSet with: testResults on: html 
	| id classesToDesc |
	classesToDesc := OrderedDictionary newFrom: { 'ok'->'test case passed (OK)'. 'failed'->'test case failed'. 'exception'->'exception'. 'timeout'->'timeout'.'crash'->'crash'.'unknown'->'result unknown' } .
	html paragraph: 'Click to hide/show:'.
	html table: [ html tableRow: [ 
			classesToDesc keysAndValuesDo: [ :cl :desc | 
				id := html nextId.
				html tableData id: id; class: cl; onClick: (html jQuery script: [ :s | s << ((s jQuery id: id asString) hasClass: cl) then: ((s jQuery: 'tr.',cl) addClass: cl,'-hidden') else:  ((s jQuery: 'tr.',cl) removeClass: cl,'-hidden'). s << ((s jQuery id: id asString) hasClass: cl) then: ((s jQuery id: id asString) removeClass: cl) else:  ((s jQuery id: id asString) addClass: cl)  ]); with: desc.  
			]
 	] ] .

	html mdlGrid: [ html mdlCell size: 12; with: [ 
	html paragraph: 'Double click to see answers:'.
	html mdlTable
		shadow: 2; style: 'width: 100%;';
		with: [ 
			html tableHead: [ 
				html mdlTableHeading with: 'Nr'. html mdlTableHeading nonNumerical; with: 'Test text'. html mdlTableHeading nonNumerical; with: 'Status'. html mdlTableHeading: 'Answer size'.				
			 ].
			html tableBody: [ 
				testResults do: [ :testResult | | anId exact | 
				 	anId := html nextId. 
					exact := testResult test requirements = reqSet.
					html tableRow class: 'exact' if: exact; class: 'plus' if: exact not; class: 'plus-hidden' if: exact not; id: anId; class: testResult label asLowercase; 
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
