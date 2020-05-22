rendering
renderExcludingRequirementsOn: html
	| addRequirementBlock removeRequirementBlock |
	addRequirementBlock := [ :req | self session excludingRequirements add: req  ].
	removeRequirementBlock := [ :req | (self session excludingRequirements includes: req) ifTrue: [ self session excludingRequirements remove: req ] ].
	
	self renderRequirementsOn: html title:  'Excluding requirements for configurations: ' collection:  (self session excludingRequirements) color: '000000' addBlock: addRequirementBlock  removeBlock: removeRequirementBlock .
