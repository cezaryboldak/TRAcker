accessing
addExcludingRequirement: req 
	(excludingRequirements includes: req) ifFalse: [ excludingRequirements add: req. filteredTestResults := nil. heuristics := nil ]. "filtered test results and heuristics are to be recalculated"
	^ self