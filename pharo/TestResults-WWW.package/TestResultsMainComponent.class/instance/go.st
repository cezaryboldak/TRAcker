running
go
	| result |
	result := nil.
	[ result ] whileNil: [ 
		result := 	self call: TestResultsLoadTestResults new.
		result ifNotNil: [ self call: TestResultsAnalyzer new ]
	]
