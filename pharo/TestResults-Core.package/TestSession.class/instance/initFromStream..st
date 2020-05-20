initializing
initFromStream: aStream
	| lineReader line |
	
	tests := OrderedCollection new.
	testResults := OrderedCollection new.
	
	lineReader := ZnLineReader on: aStream.
	lineReader limit: 16777216.
	[ (line := lineReader nextLine) isEmpty ]
		whileFalse: [ | tokens test result |
			tokens := line splitOn: Character tab.
			test := Test fromText: (tokens at: 2) number: (tokens at: 1).
			result := ResultOfTest new.
			((tokens at: 5) = 'OK') ifTrue: [ result result: #OK ] ifFalse: [ result result: #FAILED ].
			result message: (tokens at: 5). 
			result answer: (tokens at: 3).
			test answer: (tokens at: 4).
			test answerSize:(tokens at: 8).
			result test: test.
			test result: result.
			tests add: test .
			testResults add: result
		].
	self recalculateInitials 
