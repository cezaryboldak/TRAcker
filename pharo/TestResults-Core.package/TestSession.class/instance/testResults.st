accessing
testResults
	"returns only test results that are not excluded by some requirements"
	filteredTestResults ifNil: [ self filterTestResults  ].
	^ filteredTestResults