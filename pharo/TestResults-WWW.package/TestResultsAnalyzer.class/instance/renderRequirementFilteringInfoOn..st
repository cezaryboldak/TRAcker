rendering
renderRequirementFilteringInfoOn: html 
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle with: [
						html heading level5; with: 'Requirement filtering'. 
					].
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent class: 'help'; with: [ 
					html paragraph: 'We can filter test cases we wish to view in further detailed analysis by selecting "Including" and/or "Excluding" relationships:'.
					html unorderedList: [ 
						html listItem: 'Including relationships: We will view only test cases tagged with at least one of the including relationships.'.
						html listItem: 'Excluding relationships: We will not view test cases tagged with at least one of the excluded relationships.'.
					] .
					html paragraph: 'By clicking on CHANGE button we can select/deselect including or excluding relationships.'.
				]
			]
