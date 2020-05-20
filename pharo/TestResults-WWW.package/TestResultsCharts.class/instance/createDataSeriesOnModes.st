preparation
createDataSeriesOnModes
	| data failedBlock passedBlock |
	
	failedBlock := [ :testCases | (HighchartsSeriesPieData new y: (testCases count: [ :test | test result ~= #OK ]); name: 'FAILED'; color: '#FF0000'; colorIndex: 200; yourself)  ].
	passedBlock := [ :testCases | (HighchartsSeriesPieData new y: (testCases count: [ :test | test result = #OK ]); name: 'PASSED'; color: '#00FF00'; colorIndex: 200; yourself) ].
	
	data := OrderedCollection streamContents: [ :stream |
		((combinations copyFrom:2 to: (combinations size - 1)) splitOn: '},{') do: [ :combText | | series |
				series := OrderedCollection streamContents: [ :streamSeries | | combSet testCases dict | 
					combSet := (combText isEmpty) 
							ifTrue: [ Set new ]
							ifFalse: [ ((combText splitOn: ',') collect: [ :str | str asSymbol ]) asSet ].
					streamSeries nextPut: combSet.
					dict := Dictionary new.
					"NOT OPTIMAL !"
					testCases := self session testSession testResults select: [ :tr | tr test requirements = combSet ].
					dict at: 'NETTO' put: (Array with: (failedBlock value: testCases) with: (passedBlock value: testCases)).
					testCases := self session testSession testResults select: [ :tr | tr test requirements includesAll: combSet ].
					dict at: 'BRUTTO' put: (Array with: (failedBlock value: testCases) with: (passedBlock value: testCases)).
					testCases := self session testSession testResults select: [ :tr | (tr test requirements includesAll: combSet) and: [ (tr test requirements difference: combSet) isNotEmpty ] ].
					dict at: 'PLUS' put: (Array with: (failedBlock value: testCases) with: (passedBlock value: testCases)).
					streamSeries nextPut: dict
				].
				stream nextPut: series
				]
		 ].
	^ data.
	
