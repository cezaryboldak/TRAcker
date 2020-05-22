rendering
renderChosenRequirementsOn: html
	| addRequirementBlock removeRequirementBlock |
	addRequirementBlock := [ :req | self session chosenRequirements add: req  ].
	removeRequirementBlock := [ :req | (self session chosenRequirements includes: req) ifTrue: [ self session chosenRequirements remove: req ] ].

	self renderRequirementsOn: html title:  'Including requirements for configurations: ' collection:  (self session chosenRequirements) color: '00ffff' addBlock: addRequirementBlock  removeBlock: removeRequirementBlock .
