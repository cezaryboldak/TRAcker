rendering
renderStatisticsOn: html 
    | requirements |
    requirements := {  #Follows. #FollowsT. #Parent. #ParentT. #Calls. #CallsT. #Modifies. #ModifiesT. #Uses. #Next. #NextT. #Pattern. #With. #<>. #Underscore. #Boolean. #Affects. #AffectsT  }.
	html heading level3; with: 'Statistics'.
	 html div: [ html table class: 'stats';with:[ 
		html tableRow: [ requirements do: [ :req | html tableHeading: '% passed ', req asString ] ].
		html tableRow: [ requirements do: [ :req | 
				|testCases| 
				testCases := self session testSession testResults select: [ :tr | tr test requirements = (Set newFrom: {req}) ]. 
				testCases ifEmpty: [ html tableData: '-' ] ifNotEmpty: [ html tableData: ((testCases select: [ :tc | tc result = #OK ]) size  / testCases size)  asString  ].
				  ] ]
	 ] ]
