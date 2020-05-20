rendering
renderTestCasesTableInfoOn: html
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle with: [
						html heading level5; with: 'Test cases'. 
					].
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent class: 'help'; with: [ 
					html paragraph: 'Test cases for a given relationship configuration filtered in one of the following ways'.
					html unorderedList: [ 
						html listItem: 'NETTO - to view only test cases tagged by a given relationship configuration, and not by any other relationships.'.
						html listItem: 'BRUTTO - to view test cases tagged by a given relationship configuration and possibly yet other relationships.'.
						html listItem: 'PLUS - to view test cases tagged by a given relationship configuration and at least one yet other relationship.'
					] .
					html paragraph: 'Double clicking on a test case (a row in the table) shows the details of that test case.'.
				]
			]