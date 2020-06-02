initialization
initialize 
	super initialize.
	sortKey := #DFOrder.
	ascending := true.
	elementsToShow := 10.
	position := 1.
	self recalculateHeuristics 
