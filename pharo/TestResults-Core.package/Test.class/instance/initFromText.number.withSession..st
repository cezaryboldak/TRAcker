initializing
initFromText: aText number: aNumber withSession: aSession
	self testSession: aSession.
	text := aText.
	number := aNumber asInteger .
	allRequirements := Set new.
	self testSession requirements keysAndValuesDo: [ :symbol :catRegexp |
		((catRegexp at: 2) asRegexIgnoringCase search: text) ifTrue: [ allRequirements add: symbol ]
		
		 ].
	 requirements := allRequirements shallowCopy