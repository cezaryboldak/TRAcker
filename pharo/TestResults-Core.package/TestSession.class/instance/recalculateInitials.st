initializing
recalculateInitials
	| params |
	params := #( #TCNeeded #TCCount #TCFailCount #TCPassCount #TestCoverage #Reliability #DBR #DFE #DSI #DFOrder).
	requirements := Set new.
	combinations := Set new.
	tests do: [ :test | combinations add: test requirements.test requirements do: [ :req |  requirements add: req]].
	combinations := combinations asOrderedCollection .
	combinations sort: [ :a :b | a size > b size ].
	heuristics := OrderedDictionary newFromKeys: (combinations) andValues: (combinations collect: [:c | Dictionary new]).
	
	heuristics keysAndValuesDo: [ :comb :dict  |
		params do: [ :param | dict at: param put: (self perform: (param,':' asSymbol) with: comb asArray ) ].
		dict at: #Req put: comb
	]
	
	