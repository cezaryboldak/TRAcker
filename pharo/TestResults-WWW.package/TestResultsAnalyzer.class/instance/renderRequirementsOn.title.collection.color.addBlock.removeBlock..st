rendering
renderRequirementsOn: html title: aTitle collection: reqSet color: aColor addBlock: addReqBlock removeBlock: removeReqBlock
	"generic method for rendering the requirement filtering  form; 
	two last params are 1-param blocks executed when a requirement is to be added / removed (this requirement is then the parameterof this block)"
	html paragraph: [ 
		html div class: 'toggle',aColor; with: [ 
			html span: aTitle ; space. 
			reqSet asOrderedCollection sort;  do: [ :req | html mdlChip with: [  | reqText reqEnd |
																reqText := req greaseString.
																reqEnd := ((reqText last = $T) | (reqText last = $>)) ifTrue: [ reqText last asString ] ifFalse: [ '' ].
																html mdlChipContact hexColor: aColor ; with: (reqText at: 1) asString,reqEnd. 
																html mdlChipText: req greaseString ] ].
			html space.
			html mdlButton raised; primaryColor; rippleEffect;
					onClick: (html jQuery: 'div.toggle',aColor) toggle;
					with: 'Change'
	] ].
	html div class: 'toggle',aColor; style: 'display:none'; with: [ 
		html text: aTitle ; space. 
		html form: [
			(self session requirements) asOrderedCollection sort;  do: [ :req | 
				html mdlCheckboxLabel: req greaseString .
				html mdlCheckbox 
					value: (reqSet includes: req); 
					callback: [ :value  | value ifTrue: [ addReqBlock value: req ] 
													ifFalse: [ removeReqBlock value: req ]
													]  .
				html space.
			].
			html mdlButton raised; rippleEffect; with: 'Accept'
		].
	].
