initializing
initFromText: aText withSession: aSession
	self testSession: aSession.
	^ self initFromText: aText number: 0 withSession: aSession