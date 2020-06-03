rendering
renderRequirementsOn: html title: aTitle collection: reqSet color: aColor addBlock: addReqBlock removeBlock: removeReqBlock
	"generic method for rendering the requirement filtering  form; 
	two last params are 1-param blocks executed when a requirement is to be added / removed (this requirement is then the parameterof this block)"
	| reqsByCategory |
	reqsByCategory := TestResultsHttpSession requirementsByCategory first.
	html paragraph: [ 
		html div class: 'toggle',aColor; with: [ 
			html heading level6; with: [ html strong: aTitle. 	html space. 
				html mdlButton raised; primaryColor; rippleEffect;
					onClick: (html jQuery: 'div.toggle',aColor) toggle;
					with: 'Change'
 			]. 
			reqsByCategory keysAndValuesDo: [ :category :categoryRequirements | | requirementsFromCategory| 
				requirementsFromCategory := reqSet intersection: categoryRequirements.
				requirementsFromCategory ifNotEmpty: [  
					html emphasis: category greaseString. html text: ': '.
					requirementsFromCategory asOrderedCollection sort;  do: [ :req | html mdlChip with: [  | reqText reqEnd |
																reqText := req greaseString.
																reqEnd := ((reqText last = $T) | (reqText last = $>)) ifTrue: [ reqText last asString ] ifFalse: [ '' ].
																html mdlChipContact hexColor: aColor ; with: (reqText at: 1) asString,reqEnd. 
																html mdlChipText: req greaseString ] ].
					html break.
				]
			]
	] ].
	html div class: 'toggle',aColor; style: 'display:none'; with: [ 
		html heading level6; with: [ html strong: aTitle ].
		html form: [
			reqsByCategory keysAndValuesDo: [ :category :categoryRequirements | 
					html emphasis: category greaseString. html text: ': '.
					categoryRequirements asOrderedCollection sort;  do: [ :req | 
						html mdlCheckboxLabel: req greaseString .
						html mdlCheckbox 
							value: (reqSet includes: req); 
							callback: [ :value  | value ifTrue: [ addReqBlock value: req ] 
															    ifFalse: [ removeReqBlock value: req ]
													]  .
						html space.
					].
					html break.
			 ].
			html mdlButton raised; rippleEffect;
					onClick: (html jQuery: 'div.toggle',aColor) toggle;
					with: 'Cancel'.

			html mdlButton raised; accentColor; rippleEffect; with: 'Accept'
		].
	].
