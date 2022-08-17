rendering
renderResultTableInfoOn: html 
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle with: [
						html heading level4; with: 'Metrics'. 
					].
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent class: 'help'; with: [ 
					html paragraph: 'Each row corresponds to a relationship configuration that has been tested by at least one test case. Rows are highlighted with colors as follows:'.
					html unorderedList: [ 
						"html listItem: [ html span class: 'allRequiredPassed'; with: 'Dark green'. html span: ' This relationship configuration was sufficiently covered by test cases (i.e., the number of test cases was at least #TCNeeded) and all test cases passed.']."
						html listItem: [ html span class: 'allRequiredPassed'; with: 'Dark green'. html span: ' All test cases passed.'].
						"html listItem: [ html span class: 'allPassedButMissing'; with: 'Light green'. html span: ' This relationship configuration was NOT sufficiently covered by test cases (i.e., the number of test cases was less than #TCNeeded) and all test cases passed.']."
						html listItem: [ html span class: 'mostPassed'; with: 'Yellow'. html span: ' More test cases for this relationship configuration passed than failed.'].
						html listItem: [ html span class: 'mostFailed'; with: 'Light red'. html span: ' More test cases for this relationship configuration failed than passed.'].
						html listItem: [ html span class: 'allFailed'; with: 'Dark red'. html span: ' All test cases for this relationship configuration failed.']
					] .
					html paragraph: 'Table is sortable by each column in ascending or descending order.'.
					html paragraph: 'If in a given row DFOrder and DFE are empty, it means there were no failed test cases for the corresponding relationship configuration.'.
					html paragraph: 'Double clicking on a row in the table allows us to view test cases for a given relationship configuration.'.
					html paragraph: 'We can view failed and passed test cases for selected relationship configurations by checking boxes on the left, and then clicking on  SHOW CHARTS … button at the bottom.'.
				]
			]
