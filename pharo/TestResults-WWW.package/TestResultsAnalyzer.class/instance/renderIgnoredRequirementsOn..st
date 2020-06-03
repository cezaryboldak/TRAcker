rendering
renderIgnoredRequirementsOn: html
	| addRequirementBlock removeRequirementBlock |
	addRequirementBlock := [ :req | self session testSession addIgnoredRequirement: req. heuristics := nil  ]. "invalidate heuristics - to be recalculated"
	removeRequirementBlock := [ :req | self session testSession removeIgnoredRequirement: req. heuristics := nil ].


	self renderRequirementsOn: html title:  'Ignored requirements: ' collection:  (self session testSession copyOfIgnoredRequirements)  color: '888888' addBlock: addRequirementBlock removeBlock: removeRequirementBlock 
