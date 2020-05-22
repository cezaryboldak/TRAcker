rendering
renderSubContentOn: html
	| reqSet |

	html div: [ 
		html heading: 'Load test results'.
		self renderInfoOn: html.
		html paragraph: 'That should be copy-pasted from PipeTester and put in a text file '.
		html form multipart  with: [ 
			html text: 'Test results file:'.
			html fileUpload callback: [ :file | self session testSession: (TestSession new initFromWAFile: file)  ]; required.
			html break.
			"
			html text: 'Requirement set:'.
			html select 
				list: TestResultsHttpSession requirementsSets ;
				callback: [ :value | self session requirements: value. self session chosenRequirements: value copy . self session excludingRequirements: Set new ].
			html break."
			html submitButton callback: [ self answer: #OK ]; value: 'Upload'.
			html break.
			
			 ]
		 ].
	reqSet := TestResultsHttpSession requirementsSets first.
	self session requirements: reqSet. self session chosenRequirements: reqSet copy . self session excludingRequirements: Set new. 

