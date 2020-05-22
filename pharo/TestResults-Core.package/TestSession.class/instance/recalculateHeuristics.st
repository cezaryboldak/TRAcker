initializing
recalculateHeuristics
	| params |
	
	"refresh also active combinations"
	combinations := Set new.
	self testResults do: [ :testResult | combinations add: testResult test requirements. ].
	combinations := combinations asOrderedCollection .
	combinations sort: [ :a :b | a size > b size ].

	params := #( #TCNeeded #TCCount #TCFailCount #TCPassCount #TestCoverage #Reliability #DBR #DFE #DSI #DFOrder).
	heuristics := OrderedDictionary newFromKeys: (combinations) andValues: (combinations collect: [ :c | Dictionary new ]).
	
	heuristics keysAndValuesDo: [ :comb :dict  |
		params do: [ :param | dict at: param put: (self perform: (param,':' asSymbol) with: comb asArray) ].
		dict at: #Req put: comb
	]
	
	