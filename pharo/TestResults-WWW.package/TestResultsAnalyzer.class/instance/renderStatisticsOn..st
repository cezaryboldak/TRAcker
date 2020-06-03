rendering
renderStatisticsOn: html 
   | requirements stats quantityBlocks relations |
	stats := OrderedCollection new.
	relations := TestResultsHttpSession requirementsByCategory first at: #Relations.
	quantityBlocks := { [ :val | val = 2 ]. [ :val | val = 3 ]. [ :val | val > 3 ]. [ :val | val > 1 ]  }.
   requirements := {  #Follows. #FollowsT. #Parent. #ParentT. #Calls. #CallsT. #Modifies. #ModifiesT. #Uses. #Next. #NextT. #Pattern. #With. #<>. #Underscore. #Boolean. #Affects. #AffectsT  }.
	html heading level3; with: 'Statistics'.
	html div: [ html table class: 'stats';with:[ 
		html tableRow: [ requirements do: [ :req | html tableHeading: '% passed ', req asString ]. html tableHeading: '% passed 2 rel'. 
			html tableHeading: '% passed 3 rel'. html tableHeading: '% passed >3 rel'. html tableHeading: '% passed multi rel'. html tableHeading: '% total passed'. ].
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
			stats do: [ :pair | 
				html tableData: [
					(pair second = 0) 
						ifTrue: [ '-' ] 
						ifFalse: [  
							html anchor	callback: [ self call: ( TestResultsSomeTestCases new testResults: (pair third);yourself ) ];
							         	   with: ( (pair second = 0) ifTrue: [ '-' ] ifFalse: [ pair first greaseString,'/',pair second greaseString ]) 
						] 
				] 
			]. 
		]
	 ] ]
