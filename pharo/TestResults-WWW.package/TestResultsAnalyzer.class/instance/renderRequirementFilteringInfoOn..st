rendering
renderRequirementFilteringInfoOn: html 
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle with: [
						html heading level4; with: 'Requirement filtering'. 
					].
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent class: 'help'; with: [ 
					html paragraph: 'We can filter requirements we wish to view in further detailed analysis by selecting "Including" and/or "Excluding" options:'.
					html unorderedList: [ 
						html listItem: 'Including requirements for configurations: We will view (in the table below) only requirement configurations tagged with at least one of the including relationships.'.
						html listItem: 'Excluding requirements for configurations: We will not view (in the table below) requirement configurations tagged with at least one of the excluded relationships.'.
						html listItem: 'Excluding requirements for test cases: We exclude all test cases tagged with at least one of the excluded relationships. They will not be visible in any place nor be taken into account in any aclculations !'.
						html listItem: 'Ignored requirements: Test cases will not be tagged with these requirements (as side effect - number of configurations will be lower).'.
					] .
					html paragraph: 'By clicking on CHANGE button we can select/deselect including or excluding relationships.'.
				]
			]
