rendering
renderRequirementFilteringOn: html 
	self renderRequirementFilteringInfoOn: html.
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick; 
				with: [ html mdlExpansionPanelHeaderTitle with: [
						html span: 'Number of not excluded test cases: ', self session testSession testResults size greaseString . 
						html span: ',   expand to filter...'.
						
					].
					html mdlExpansionPanelHeaderIcon.
				 ].
			html
				mdlExpansionPanelContent with: [ 
					
					self renderChosenRequirementsOn: html.
					self renderExcludingRequirementsOn: html.
					self renderTestExcludingRequirementsOn: html.
					self renderIgnoredRequirementsOn: html.
				]
			]

