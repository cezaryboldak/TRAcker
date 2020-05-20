calculations
untestedCombinationsUpTo: maxSize 
	| all |
	
	all := Array streamContents: [ :stream |
		1 to: maxSize do: [ :size | 
			self session requirements asOrderedCollection  combinations: size atATimeDo: [ :comb | stream nextPut: comb copy ] 
		]
		
	].
	
	all := all reject: [ :comb | self session testSession combinations includes: comb  asSet].
	
	^ all
	