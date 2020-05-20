calculation
DSI1: combination
	"Defect Scope of Impact"
	((self TCPlusCount: combination) = 0)
		ifTrue: [ ^ 0 ]
		ifFalse: [ ^ 0.0 + (self TCPlusFailCount: combination) / (self TCPlusCount: combination)  ]