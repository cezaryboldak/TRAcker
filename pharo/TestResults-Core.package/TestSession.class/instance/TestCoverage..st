calculation
TestCoverage: reqCombination
	"Calculates Test Coverage for a given requirement combination"

	((self TCNeeded: reqCombination ) = 0) ifTrue: [ ^ nil ].
	
	^ ((self TCCount: reqCombination ) / (self TCNeeded: reqCombination )) min: 1