calculations
markedCombinationsUpTo: maxSize 
	"return a dictionary of dictionaries: ordered size -> ( combinations sorted by content -> number of tests #(all failed passed))"
	| res all testResults failedNr |
	
	res := OrderedDictionary new.
	1 to: maxSize do: [ :size | 
		all := Array streamContents: [ :stream |
			self session testSession requirements keys asOrderedCollection  combinations: size atATimeDo: [ :comb | stream nextPut: comb copy ] 
		].
		all sort: [ :c1 :c2 |  c1 greaseString  < c2 greaseString ].	
		"res at: size put: (OrderedDictionary newFromKeys: all andValues: (all collect: [ :comb | self session testSession combinations includes: comb asSet ])).	"
		res at: size put: (OrderedDictionary newFromKeys: all andValues: (all collect: [ :comb |
			testResults := self session testSession testResults select: [ :tr | tr test requirements = comb asSet ]. 
			failedNr := testResults count: [ :tr | tr result ~= #OK ].
			Array with: testResults size with: failedNr with: (testResults size - failedNr) ])).		
	].
	" bigger configurations "
	all := ((self session testSession testResults select: [ :tr | tr test requirements size > maxSize ]) collect: [ :tr | tr test requirements ]) asSet asArray.
	all sort: [ :c1 :c2 | (c1 size = c2 size) ifFalse: [ c1 size < c2 size ] ifTrue: [ c1 greaseString < c2 greaseString ] ].
	res at: (maxSize+1) put: (OrderedDictionary newFromKeys: all andValues: (all collect: [ :comb | 
			testResults := self session testSession testResults select: [ :tr | tr test requirements = comb asSet ]. 
			failedNr := testResults count: [ :tr | tr result ~= #OK ].
			Array with: testResults size with: failedNr with: (testResults size - failedNr) ]))	.
	
	^ res
	
	