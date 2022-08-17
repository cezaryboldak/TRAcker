rendering
renderCombinationInfoOn: html 
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle with: [
						html heading level4; with: 'Coverage of requirement configurations by test cases'. 
					].
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent class: 'help'; with: [ 
					html paragraph: 'Rows refer to test categories from single-relationship to increasingly growing in size relationship configurations.'.
					html unorderedList: [ 
						html listItem: '"Tested: n" means the number of relationship configurations in a given category for which there was at least one test case.'.
						html listItem: '"Not tested: n" means the number of relationship configurations in a given category for which there were no test cases.'.
						html listItem: [html span: 'The total number of test cases in a given category is shown in black, the number of failed tests - in'. html span class: 'failed-back'; with: ' red '. html span: ', number of passed tests - in'. html span class: 'passed-back'; with: ' green '. html span: '.'.]
					] .
					html paragraph: [ html span: 'By clicking on a given row, relationship configurations are displayed, and tested configurations are highlighted in.'. html span class: 'tested-inverted'; with:' blue '.
						html span: ', giving also number of test cases (for this configuration:'. 
						html span class: 'inverted'; with: 'all'. html span: ' '. 
						html span class: 'failed-back'; with: 'failed'.html span: ' '. 
						html span class: 'passed-back'; with: 'passed'.
						]
				]
			]
