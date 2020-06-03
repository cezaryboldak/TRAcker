accessing
addIgnoredRequirement: req 
	(ignoredRequirements includes: req) ifFalse: [ ignoredRequirements add: req. heuristics := nil ]. "filtered test results and heuristics are to be recalculated"
	^ self