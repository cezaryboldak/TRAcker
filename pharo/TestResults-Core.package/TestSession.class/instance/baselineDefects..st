calculation
baselineDefects: combination
	"Returns sub-combination that has at least one failed test"
	^ (self baseline: combination) select: [ :comb | (self testResults count: [ :result | ( result result = #FAILED ) and: [ result test requirements = comb asSet ] ])>0  ] 
	