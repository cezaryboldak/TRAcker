rendering
renderChart: chart on: html 
	| id emptyBaseline emptyRPlus myLabel data |
	
	data := (chart series at: 1) data.
	
	myLabel := reqSet asRequirements.
	emptyBaseline := (data count: [ :point | (point configurationOptions at: 'to') = myLabel ]) = 0.
	emptyRPlus := (data count: [ :point | (point configurationOptions at: 'from') = myLabel ]) = 0.

	id := html nextId.		
	chart id: id.
	(emptyBaseline | emptyRPlus)
		ifFalse: [ html div: [ html div id: id; script: chart ] ]
		ifTrue: [ html mdlGrid with: [  | cell |
			cell := html mdlCell.
			emptyBaseline  ifTrue: [ cell offset: 6 ] ifFalse: [ cell offset: 0 ]. 
			cell size: (emptyRPlus  ifTrue: [ 6 ] ifFalse: [ 12 ]).
			cell with: [ html div id: id; script: chart  ]
			 ]
		].