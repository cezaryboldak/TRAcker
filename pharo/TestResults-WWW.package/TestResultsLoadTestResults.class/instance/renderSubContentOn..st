rendering
renderSubContentOn: html
	| testSession |

	testSession := TestSession new.
			
	self session testSession: testSession .
	" default requirement set "
	testSession requirements: (TestSession SPADefaultRequirements).
	self session chosenRequirements: (testSession requirements keys asSet ) copy . 
	self session excludingRequirements: Set new.

	html mdlCell size: 12; with: [ 
		html heading: 'TRAcker - Test Results Analyzer'.
		self renderInfoOn: html.
		html paragraph: 'You can set up TRAcker for your own project (option 1), use pre-configured TRAcker for SPA project described in the paper (option 2) or load sample SPA files (option 3, no external files needed).'.
		html heading level4; with: '1. Upload all configuration files for your project:'.
		html form multipart  with: [ 
			" I hope this upload callback will be evaluated as first "
			html paragraph: [ 
				html strong: 'Requirement definition:  '.
				html fileUpload callback: [ :file | testSession requirementsFromFile: file.	self session chosenRequirements: (testSession requirements keys asSet) copy  ]; required.
				html mdlAnchorButton	url: (DemoRequirementsFileLibrary urlOf: #demoRequirementsTxt);	with: 'Sample format'.
				html break.
				html strong: 'TCNeeded values:  '.
				html fileUpload callback: [ :file | testSession TCNeededFromFile: file  ].
				html mdlAnchorButton url: (DemoRequirementsFileLibrary urlOf: #demoTCNeededTxt); with: 'Sample format'.
				html break.
				html strong: 'Test results file:  '.
				html fileUpload callback: [ :file | testSession initFromWAFile: file.   ]; required.
				html mdlAnchorButton	url: (DemoRequirementsFileLibrary urlOf: #demoTestsTxt); with: 'Sample format'.
			].
			
			html mdlButton raised; accentColor; rippleEffect; callback: [ self answer: #OK ]; value: 'Upload'.
		].
		html heading level4; with: '2. Upload test results for SPA project:'.
		html form multipart  with: [ 
			html paragraph: [ 
				html strong: 'TCNeeded values (optional):  '.
				html fileUpload callback: [ :file | testSession TCNeededFromFile: file  ].
				html break.
				html strong: 'SPA Test results file:  '.
				html fileUpload callback: [ :file | testSession initFromWAFile: file.   ]; required.
			].
			
			html mdlButton raised; accentColor; rippleEffect; callback: [ self answer: #OK ]; value: 'Upload SPA tests'.
		].
		html heading level4; with: '3. Upload demo SPA files:'.
		html form multipart  with: [ 
			html paragraph: [ 
				html mdlButton raised; accentColor; rippleEffect; callback: [ self uploadDemoSession: testSession . self answer: #OK ]; with: 'Upload Demo Files'.
			].
		].
	].
