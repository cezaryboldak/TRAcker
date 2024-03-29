rendering
renderSubContentOn: html 
	| testResult correctAnswerSet actualAnswerSet |
	
	html mdlCell size: 12; with: [ html heading level:3 ; with: 'Test case ', self testCaseNumber greaseString ] .

	testResult := self session testSession testResults detect: [ :tr | tr test number = testCaseNumber ]. 
	correctAnswerSet := ((testResult test answer splitOn: ',') collect: [ :answer | answer trim ])asSet.
	actualAnswerSet := ((testResult answer splitOn: ',') collect: [ :answer | answer trim ]) asSet.

	html mdlCell size: 2; with: 'Test input'.
	html mdlCell size: 10; with: testResult test text.
	html mdlCell size: 2; with: 'Status'.
	html mdlCell size: 10; class: testResult label asLowercase; with: testResult message.
	html mdlCell size: 2; with: 'Requirments'.
	html mdlCell size: 10; with: [
		testResult test requirements do: [ :req | 
			| reqText reqEnd |
			html mdlChip with: [
				reqText := req greaseString.
				reqEnd := ((reqText last = $T) | (reqText last = $>)) ifTrue: [ reqText last asString ] ifFalse: [ '' ].
				html mdlChipContact hexColor: '00ffff' ; with: (reqText at: 1) asString,reqEnd. 
				html mdlChipText: req greaseString.
			].
		].
	].
	html mdlCell size: 12; with: [ html heading level: 4; with: 'Expected result' ].
	html mdlCell size: 12; with: [ html text: 'Legend: '.
	    html mdlChip class: 'present'; with: [  html mdlChipText: 'present' ]. 	html mdlChip class: 'missing'; with: [  html mdlChipText: 'missing' ] ].
	html mdlCell size: 12; with: [ 
	(testResult test answer splitOn: ',') sort; do: [ :answer | | includes |
		includes := actualAnswerSet includes: answer trim.
		html mdlChip class: 'present' if: includes; class: 'missing' if: includes not; with: [ html mdlChipText: answer ]
	]].

	html mdlCell size: 12; with: [ html heading level: 4; with: 'Actual result' ].
	html mdlCell size: 12; with: [ html text: 'Legend: '.html mdlChip class: 'present'; with: [  html mdlChipText: 'present' ]. 
 	    html mdlChip class: 'extra'; with: [  html mdlChipText: 'extra' ] ]. 
	html mdlCell size: 12; with: [ 
	(testResult answer splitOn: ',') sort; do: [ :answer | | includes |
		includes := correctAnswerSet includes: answer trim.
		html mdlChip class: 'present' if: includes; class: 'extra' if: includes not; with: [ html mdlChipText: answer ]
	]].
	html mdlCell size: 12; with: [ html mdlAnchorButton accentColor; raised; rippleEffect; callback: [ self answer ]; with: 'Close' ]
