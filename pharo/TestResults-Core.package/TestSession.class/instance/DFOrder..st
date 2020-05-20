calculation
DFOrder: combination
	"Defect Fixing Order"
	| DFO DFE DBR DSI |
	((self TCNeeded: combination ) =0) ifTrue: [ ^ nil ].
	((self TCCount: combination ) =0) ifTrue: [ ^ nil ].
	((self TCFailCount: combination ) =0) ifTrue: [ ^ nil ].
	DBR := self DBR: combination .
	DFE := self DFE: combination .
	DSI := self DSI: combination .
	(DBR isNil or: [DFE isNil or: [DSI isNil]]) ifTrue: [ ^ nil ].
	DFO := combination size + (((self DFE: combination)+1-(self DBR: combination)+1-(self DSI: combination))/3.0).
	^ DFO 