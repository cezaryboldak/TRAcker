private
uploadDemoSession: testSession 
	| fileRequirements fileTests fileTCNeeded |

	fileRequirements := WAFile new. 
	fileRequirements contents: (DemoRequirementsFileLibrary new demoRequirementsTxt); fileName: 'demoRequirements.txt'.
	testSession requirementsFromFile: fileRequirements .	
	self session chosenRequirements: (testSession requirements keys asSet) copy.

	fileTCNeeded := WAFile new. 
	fileTCNeeded contents: (DemoRequirementsFileLibrary new demoTCNeededTxt); fileName: 'demoTCNeeded.txt'.
	testSession TCNeededFromFile: fileTCNeeded.
	
	fileTests := WAFile new.
	fileTests  contents: (DemoRequirementsFileLibrary new demoTestsTxt); fileName: 'demoTests.txt'.
	testSession initFromWAFile: fileTests .	
	
