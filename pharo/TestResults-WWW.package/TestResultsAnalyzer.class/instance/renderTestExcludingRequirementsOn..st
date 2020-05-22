rendering
renderTestExcludingRequirementsOn: html
	| addRequirementBlock removeRequirementBlock |
	addRequirementBlock := [ :req | self session testSession addExcludingRequirement: req. heuristics := nil  ]. "invalidate heuristics - to be recalculated"
	removeRequirementBlock := [ :req | self session testSession removeExcludingRequirement: req. heuristics := nil ].


	self renderRequirementsOn: html title:  'Excluding requirements for test cases: ' collection:  (self session testSession copyOfExcludingRequirements)  color: '311010' addBlock: addRequirementBlock removeBlock: removeRequirementBlock 
