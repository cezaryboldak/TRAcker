calculation
DBR2: reqCombination
	"new version of Defect Baseline Reliability = avg_(x subset R) Rel "

	| baseline reliabilities |
	baseline := (self baseline: reqCombination) reject: [ :reqs | (self TCNeeded: reqs )=0 ].
	
	baseline isEmpty ifTrue: [ ^ 1 ].
	
	reliabilities := (baseline reject: [ :rel | rel isNil ] )
						collect: [ :reqs | self Reliability: reqs ].
	
	^ reliabilities average