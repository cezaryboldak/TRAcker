calculation
DFE2: reqCombination
	"new version of Deffect Fixing Effort: 1-Rel"

	((self TCNeeded: reqCombination ) =0) ifTrue: [ ^ nil ]. " not valid req combination"
	((self TCFailCount: reqCombination ) =0) ifTrue: [ ^ nil ]. "no failed test cases"
	^ 1 - (self Reliability: reqCombination )