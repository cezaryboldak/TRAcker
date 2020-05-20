calculation
TCNeededFromReqCount: combination
	"return TCNeeded based only on the requirement combination count"

	| reqCount |
	reqCount := combination size.
	^ (20-(5*reqCount)) max: 5.   "reqCount*2 + 3"