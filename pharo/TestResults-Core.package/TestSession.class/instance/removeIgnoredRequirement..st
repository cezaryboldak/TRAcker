accessing
removeIgnoredRequirement: req 
	(ignoredRequirements includes: req) ifTrue: [ ignoredRequirements remove: req. heuristics := nil ]. "and heuristics are to be recalculated"
	^ self