initializing
initFromText: aText number: aNumber
	text := aText.
	number := aNumber asInteger .
	requirements := Set new.
	self class relations keysAndValuesDo: [ :symbol :regexp |
		( regexp asRegex search: text) ifTrue: [ requirements add: symbol ]
		
		 ]