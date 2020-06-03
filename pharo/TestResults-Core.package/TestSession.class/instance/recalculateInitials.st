initializing
recalculateInitials
	requirements := Set new.
	excludingRequirements := Set new.
	ignoredRequirements := Set new.
	filteredTestResults := testResults shallowCopy. "since not excluding requirements"
	combinations := Set new.
	tests do: [ :test | combinations add: test requirements. test requirements do: [ :req |  requirements add: req ] ].
	combinations := combinations asOrderedCollection .
	combinations sort: [ :a :b | a size > b size ].

	self recalculateHeuristics 	
	