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
			test := Test
				fromText: (tokens at: 2)
				number: (tokens at: 1)
				withSession: self.
			result := ResultOfTest new.
			result result: #UNKNOWN.
			(tokens at: 5) asLowercase = 'ok'
				ifTrue: [ result result: #OK ].
			(tokens at: 5) asLowercase = 'timeout'
				ifTrue: [ result result: #TIMEOUT ].
			(tokens at: 5) asLowercase = 'fail'
				ifTrue: [ result result: #FAILED ].
			(tokens at: 5) asLowercase = 'exception'
				ifTrue: [ result result: #EXCEPTION ].
			(tokens at: 5) asLowercase = 'crash'
				ifTrue: [ result result: #CRASH ].
			result message: (tokens at: 5).
			result answer: (tokens at: 3).
			test answer: (tokens at: 4).
			test answerSize: (tokens at: 8).
			result test: test.
			test result: result.
			tests add: test.
			testResults add: result ].
	self recalculateInitials