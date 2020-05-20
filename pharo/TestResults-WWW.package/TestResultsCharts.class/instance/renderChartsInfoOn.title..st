rendering
renderChartsInfoOn: html title: aTitle
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle with: [
						html heading level5; with: aTitle. 
					].
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent class: 'help'; with: [ 
					html paragraph: 'The green and red area in the pie chart reflects relative size of passed and failed test case sets, respectively.'.
					html paragraph: 'Three tabs at the top -  NETTO, BRUTTO and NETTO - allow you to select a desired mode:'.
					html unorderedList: [ 
						html listItem: 'NETTO - to view only test cases tagged by a given relationship configuration, and not by any other relationships.'.
						html listItem: 'BRUTTO - to view test cases tagged by a given relationship configuration and possibly yet other relationships.'.
						html listItem: 'PLUS - to view test cases tagged by a given relationship configuration and at least one yet other relationship.'
					] .
					html paragraph: 'By pointing the mouse on the green or red you can see the number of test cases represented by that area.'.
					html paragraph: 'By double clicking - you will see the details of the relevant test cases.'.
					html paragraph: [ html span: 'Pie charts can be printed or exported to PNG, SVG, or JPEG files by clicking '. html mdlIcon: 'dehaze' ]
				]
			]