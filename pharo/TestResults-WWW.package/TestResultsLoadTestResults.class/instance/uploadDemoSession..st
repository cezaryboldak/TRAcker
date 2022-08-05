private
uploadDemoSession: testSession 
	| fileRequirements fileTests |
	fileRequirements := WAFile new. 
	fileRequirements contents: (DemoRequirementsFileLibrary new demoRequirementsTxt); fileName: 'demoRequirements.txt'.
	fileTests := WAFile new.
	fileTests  contents: (DemoRequirementsFileLibrary new demoTestsTxt); fileName: 'demoTests.txt'.
	testSession requirementsFromFile: fileRequirements .	
	self session chosenRequirements: (testSession requirements keys asSet) copy.
	testSession initFromWAFile: fileTests .	