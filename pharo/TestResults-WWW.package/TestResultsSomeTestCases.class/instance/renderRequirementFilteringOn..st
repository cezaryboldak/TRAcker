rendering
renderRequirementFilteringOn: html 
	
	html heading level5 with: [ html text: 'Requirement filtering'. html small: ' (click to hide/show)' ].

	self renderRequirementFilteringOn: html entitled: 'including requirements' withClass: 'includingReqsFilter' initiallyMarked: true.	

	self renderRequirementFilteringOn: html entitled: 'excluding requirements' withClass: 'excludingReqsFilter' initiallyMarked: false.	
