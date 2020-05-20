initialization
open
	| session |
	session := TestSession loadFromFile.
	self openOn: session.