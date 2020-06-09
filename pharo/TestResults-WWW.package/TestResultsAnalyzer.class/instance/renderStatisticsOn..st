rendering
renderStatisticsOn: html 
   | requirements stats quantityBlocks headers |
	stats := OrderedCollection new.
	quantityBlocks := { [ :val | val = 2 ]. [ :val | val = 3 ]. [ :val | val > 3 ]. [ :val | val > 1 ]  }.
   requirements := {  #Follows. #FollowsT. #Parent. #ParentT. #Calls. #CallsT. #Modifies. #ModifiesT. #Uses. #Next. #NextT. #Pattern. #With. #<>. #Underscore. #Boolean. #Affects. #AffectsT  }.
	html heading level3; with: [ html text: 'Statistics'; small: ' %passed' ].
	
	headers := OrderedCollection new.
	requirements do: [ :req | headers add: req asString ]. 
	headers add: '2 relations'. headers add: '3 relations'. headers add: '>3 relations'. headers add: 'multi relations'. headers add: 'Total'.
	html div: [ html table class: 'stats';with:[ 
		html tableRow: [ headers do: [ :desc | html tableHeading: desc ] ] .
		html tableRow: [ | testCases passed |
			"concrete requirements"
			requirements do: [ :req | 
				testCases := self session testSession testResults select: [ :tr | tr test requirements = (Set newFrom: {req}) ]. 
				passed := testCases select: [ :tc | tc result = #OK ].
				stats add: (Array with: passed size with: testCases size with: testCases).
				  ].
			"relation quantity"
			quantityBlocks do: [ :quantityBlock | 
				testCases := self session testSession testResults select: [ :tr | quantityBlock value: (tr test countSelectPhrases ) ]. 
				passed := testCases select: [ :tc | tc result = #OK ].
				stats add: (Array with: passed size with: testCases size with: testCases).
			].
			"total passed"
			testCases := self session testSession testResults. 
			passed := testCases select: [ :tc | tc result = #OK ].
			stats add: (Array with: passed size with: testCases size with: testCases).
		].
		html tableRow: [ 
			stats do: [ :pair | html tableData: ( (pair second = 0) ifTrue: [ '-' ] ifFalse: [ self numberFormat: (pair first / pair second * 100) ] ) ] ]. 
		html tableRow: [ 
			stats withIndexDo: [ :pair :index | 
				html tableData: [
					(pair second = 0) 
						ifTrue: [ '-' ] 
						ifFalse: [  
							html text: pair first greaseString,'/'.
							html anchor	callback: [ self call: ( TestResultsSomeTestCases new testResults: (pair third); title: (headers at: index); yourself ) ];
							         	   with: pair second greaseString  
						] 
				] 
			]. 
		]
	 ] ]
