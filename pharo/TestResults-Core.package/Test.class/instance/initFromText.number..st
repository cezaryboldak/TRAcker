initializing
initFromText: aText number: aNumber
	text := aText.
	number := aNumber asInteger .
	allRequirements := Set new.
	self class relations keysAndValuesDo: [ :symbol :regexp |
		(regexp asRegexIgnoringCase search: text) ifTrue: [ allRequirements add: symbol ]
		
		 ].
	 requirements := allRequirements shallowCopy 