accessing
removeExcludingRequirement: req 
	(excludingRequirements includes: req) ifTrue: [ excludingRequirements remove: req. filteredTestResults := nil. heuristics := nil ]. "filtered test results and heuristics are to be recalculated"
	^ self