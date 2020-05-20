rendering
classFor: row 
	| tccount tcfailedcount tcpassedcount reliability tcneeded |
	tccount := row at: ((headers indexOf: #TCCount)+1).
	tcfailedcount := row at: ((headers indexOf: #TCFailCount)+1).
	tcpassedcount := tccount - tcfailedcount .
	reliability := row at: ((headers indexOf: #Reliability)+1).
	tcneeded := row at: ((headers indexOf: #TCNeeded)+1).
	(tcfailedcount = 0) 
		ifTrue: [ 
			(tccount = 0) ifTrue: [ ^ '' ].
			(tccount >= tcneeded) ifTrue: [ ^ 'allRequiredPassed' ].
			^ 'allPassedButMissing'.
			 ].
	
	(tcpassedcount = 0) ifTrue: [ ^ 'allFailed' ].
	(tcpassedcount > tcfailedcount) ifTrue: [ ^ 'mostPassed' ].
	^ 'mostFailed'
