private
filterTestResults
	filteredTestResults := excludingRequirements isEmpty
		ifTrue: [ testResults shallowCopy ]
		ifFalse: [ testResults
				reject: [ :testResult | 
					(testResult test requirements intersection: excludingRequirements)
						isNotEmpty ] ]