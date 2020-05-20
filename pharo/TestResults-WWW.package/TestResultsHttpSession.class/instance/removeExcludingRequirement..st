modifying
removeExcludingRequirement: req 
	(excludingRequirements includes: req) ifTrue: [ excludingRequirements remove: req ]