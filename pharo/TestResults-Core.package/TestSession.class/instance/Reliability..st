calculation
Reliability: reqCombination
	"Calculates Reliability =  Coverage *%TCPass/100 = min( 1,|TCPass| / #TCNeeded)"

	((self TCNeeded: reqCombination) = 0) ifTrue: [ ^ nil ].
	((self TCCount: reqCombination) = 0) ifTrue: [ ^ 0 ].
	
	^ (self TCPassCount: reqCombination ) / (self TCCount: reqCombination ) * (self TestCoverage: reqCombination) .