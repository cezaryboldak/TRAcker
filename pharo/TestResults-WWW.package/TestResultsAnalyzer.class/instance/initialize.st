initialization
initialize 
	super initialize.
	sortKey := #DFOrder.
	ascending := true.
	self sortOn: sortKey ascending: ascending.
