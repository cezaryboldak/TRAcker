rendering
renderInfoOn: html 
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle: ''.
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent: [ 
					html paragraph: 'TRAcker reads test results in the following format (e.g. produced from PipeTester tool). Each field is separated by a TAB character (ASCII 9)'. 
					html unorderedList with: [ 
						html 
							listItem: 'test numerical index';
							listItem: 'test statement(s)';
							listItem: 'test expected result';
							listItem: 'test actual result';
							listItem: 'test status (OK, FAIL, ...';
							listItem: 'test time 1 - not used';
							listItem: 'test time 2 - not used';
							listItem: 'number 1 - not used';
							listItem: 'number 2 - not used';
							listItem: 'number 3 - not used';
							listItem: 'number 4 - not used'.
					]
				]
		]