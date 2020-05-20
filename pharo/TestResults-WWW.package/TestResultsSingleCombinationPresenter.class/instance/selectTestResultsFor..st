calculations
selectTestResultsFor: reqSet 
	| testResults |
	testResults := (reqSet isEmpty) 
							ifTrue: [ self session testSession testResults select: [ :tr | tr test requirements isEmpty ] ]
							ifFalse: [ self session testSession testResults select: [ :tr | tr test requirements includesAll: reqSet ] ].
	
	^ testResults 
