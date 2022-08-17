rendering
renderSubContentOn: html
	| testSession |

	testSession := TestSession new.
			
	self session testSession: testSession .
	" default requirement set "
	testSession requirements: (TestSession SPADefaultRequirements ).
	self session chosenRequirements: (testSession requirements keys asSet ) copy . 
	self session excludingRequirements: Set new.

	html mdlCell size: 12; with: [ 
		html heading: 'TRAcker - Test Results Analyzer'.
		self renderInfoOn: html.
		html paragraph: 'That should be copy-pasted from PipeTester and put in a text file '.
		html form multipart  with: [ 
			" I hope this upload callback will be evaluated as first "
			html text: 'Requirement set (optional):'.
			html fileUpload callback: [ :file | testSession requirementsFromFile: file.	self session chosenRequirements: (testSession requirements keys asSet) copy  ].
			html break.

			html text: 'TCNeeded values (optional):'.
			html fileUpload callback: [ :file | testSession TCNeededFromFile: file  ].
			html break.

			html strong: 'Test results file (obligatory):'.
			html fileUpload callback: [ :file | testSession initFromWAFile: file.   ]; required.
			html break.
			
			"
			html select 
				list: TestResultsHttpSession requirementsSets ;
				callback: [ :value | self session requirements: value. self session chosenRequirements: value copy . self session excludingRequirements: Set new ].
			"
			html break.
			html submitButton callback: [ self answer: #OK ]; value: 'Upload'.
		].
		html form multipart  with: [ 
			html paragraph: [ 
				html heading level: 5; with: 'You can use demo files:'.
				html span: ' Demo requirements: '.
				html anchor 
					url: (DemoRequirementsFileLibrary urlOf: #demoRequirementsTxt);
					with: 'demoRequirements.txt'.
				html break.
				html span: ' Demo TCNeededValues: '.
				html anchor 
					url: (DemoRequirementsFileLibrary urlOf: #demoTCNeededTxt);
					with: 'demoTCNeeded.txt'.
				html break.
				html span: ' Demo tests: '.
				html anchor 
					url: (DemoRequirementsFileLibrary urlOf: #demoTestsTxt);
					with: 'demoTests.txt'.
				html break.
				html span: ' OR '.
				html submitButton callback: [ self uploadDemoSession: testSession . self answer: #OK ]; with: 'Upload Demo Files'.
			].
		].
	].
	