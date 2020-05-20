modifying
removeChosenRequirement: req 
	(chosenRequirements includes: req) ifTrue: [ chosenRequirements remove: req ]