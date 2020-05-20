calculation
DFE1: combination
	"Defect Fixing Effort"
	((self TCCount: combination) = 0)
		ifTrue: [ ^ 0 ]
		ifFalse: [ ^ ((self TCFailCount: combination) / (self TCCount: combination ) + 1-(self DBR:combination ))/2.0 ]
