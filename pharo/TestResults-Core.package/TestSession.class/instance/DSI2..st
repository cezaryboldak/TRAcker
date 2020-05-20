calculation
DSI2: reqCombination
	" new version of Defect Scope of Impact: avg_{x in R+} (1-Rel(x))"

	| rplus reliablilities |
	" only existing (in test cases) req combinations are taken into account"
	rplus := ((self resultsPlus: reqCombination) collect: [:tr | tr test requirements]) asSet. "asSet - unique ones"
	
	rplus := rplus reject: [ :reqs | (self TCNeeded: reqs)=0  ].
	rplus isEmpty ifTrue: [ ^ 0 ].

	reliablilities := rplus collect: [ :reqs | self Reliability: reqs  ].
	reliablilities := reliablilities reject: [ :rel | rel isNil ].
	reliablilities := reliablilities collect: [ :rel | 1-rel ].
	
	^ reliablilities average  
	
