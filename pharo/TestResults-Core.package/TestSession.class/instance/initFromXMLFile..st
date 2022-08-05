initializing
initFromXMLFile: filename
	"load a test session result from an XML file produced by SPA with integrated AutoTester 
	(before PipeTester and from NUS) - NOT UPDATED FOR UPLOADED REQUIREMENTS"

	tests := OrderedCollection new.
	testResults := OrderedCollection new.
	description := filename.
	filename asFileReference
		readStreamDo: [ :readStream | 
			| document |
			document := XMLDOMParser parse: readStream.
			description := (document findElementNamed: #name) contentString.
			(document allElementsNamed: #query)
				do: [ :queryElem | 
					| test result |
					test := Test
						fromText: (queryElem findElementNamed: #querystr) contentString
						number: (queryElem findElementNamed: #id) contentString
						withSession: self.
					test meta: (queryElem findElementNamed: #id) attributes.
					(queryElem includesElement: #correct)
						ifTrue:
							[ test answer: (queryElem findElementNamed: #correct) contentString ].
					tests add: test.
					result := ResultOfTest new.
					(queryElem includesElement: #stuans)
						ifTrue:
							[ result answer: (queryElem findElementNamed: #stuans) contentString ].
					(queryElem includesElement: #passed)
						ifTrue: [ result result: #OK ]
						ifFalse: [ result result: #FAILED ].
					(queryElem includesElement: #time_taken)
						ifTrue:
							[ result time: (queryElem findElementNamed: #time_taken) contentString ].
					result test: test.
					testResults add: result ] ].
	self recalculateInitials