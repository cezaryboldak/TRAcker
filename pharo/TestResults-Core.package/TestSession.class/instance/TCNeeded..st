calculation
TCNeeded: reqCombination
	"calculates minimum number of test cases for given requirement combination"
	| set |

	set := self reqComb2Key: reqCombination . 
	((TCNeededTable isNotNil) and: [ TCNeededTable includesKey: set ]) ifTrue: [ ^ TCNeededTable at: set ]
	ifFalse: [ ^ self TCNeededFromReqCount: reqCombination  ] 