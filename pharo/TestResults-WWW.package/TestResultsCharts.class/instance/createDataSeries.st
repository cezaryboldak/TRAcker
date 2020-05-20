preparation
createDataSeries
	| data |
	
	
	data := OrderedCollection streamContents: [ :stream |
		((combinations copyFrom:2 to: (combinations size - 1)) splitOn: '},{') do: [ :combText | | series |
				series := OrderedCollection streamContents: [ :streamSeries | | combSet testCases |
					combSet := (combText isEmpty) 
							ifTrue: [ Set new ]
							ifFalse: [ ((combText splitOn: ',') collect: [ :str | str asSymbol ]) asSet ].
					streamSeries nextPut: combSet.
					testCases := self session testSession testResults select: [ :tr | tr test requirements = combSet ].
					streamSeries nextPut: (HighchartsSeriesPieData new y: (testCases count: [ :test | test result ~= #OK ]); name: 'FAILED'; colorIndex: 200; yourself) .
					streamSeries nextPut: (HighchartsSeriesPieData new y: (testCases count: [ :test | test result = #OK ]); name: 'PASSED'; colorIndex: 200; yourself) .
				].
				stream nextPut: series
				]
		 ].
	^ data.
	
