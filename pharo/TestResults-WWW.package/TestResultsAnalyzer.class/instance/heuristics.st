accessing
heuristics
	heuristics ifNil: [ self recalculateHeuristics ].
	^ heuristics