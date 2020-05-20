selecting
rPlus: combination
	"select combinations R+"
	| reqSet |
	reqSet := combination asSet.
	^ self combinations select: [ :comb | (comb asSet intersection: reqSet) = reqSet and: [ comb size > reqSet size ]  ]
