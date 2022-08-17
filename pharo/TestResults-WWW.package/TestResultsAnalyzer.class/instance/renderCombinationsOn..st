rendering
renderCombinationsOn: html
	| marked titles |
	
	self renderCombinationInfoOn: html.
	marked := self markedCombinationsUpTo: 4.
	titles := #('single requirements' 'requirement pairs' 'requirement triples' 'requirement quadruples' 'requirement n-tuples').
	marked keysAndValuesDo: [ :size :combToTest |
		html mdlCell size: 12; with: [ 
		html mdlExpansionPanel
			shadow: 2;
			fold;
			with: [ 
				html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ 
					html mdlExpansionPanelHeaderTitle: ((size asString), '. ', (titles at: size)).
					combToTest isEmpty ifFalse: [ 
						html mdlExpansionPanelHeaderDescription: [ 
							html span class: 'tested'; with: 'Tested: ',(combToTest count: [ :pair | (pair value at: 1) > 0 ]) asString. html space.
							html span class: 'untested'; with: 'Not tested: ',(combToTest count: [ :pair | (pair value at: 1) = 0 ]) asString. 
							html span class: 'black'; with: ' ',(combToTest collect: [ :pair | pair value  at: 1 ]) sum greaseString,' test(s) '.
							html mdlChip class: 'failed-back'; with: [  html mdlChipText class: 'failed-back'; with: ((combToTest collect: [ :pair | pair value at: 2 ]) sum greaseString) ].
							html mdlChip class: 'passed-back'; with: [  html mdlChipText class: 'passed-back'; with: ((combToTest collect: [ :pair | pair value at: 3 ]) sum greaseString) ].
						].
						html mdlExpansionPanelHeaderIcon
					] ifTrue: [ html mdlExpansionPanelHeaderDescription: ' no tests' ] 
				].
				combToTest isEmpty ifFalse: [ 
					html mdlExpansionPanelContent: [ 
						combToTest keysAndValuesDo: [ :comb :arrTests | 
							html span class: 'tested-inverted' if: (arrTests at: 1) > 0; class: 'untested' if: (arrTests at: 1)=0; with: (self reqFormat: comb). html span: ' '.
							((arrTests at: 1) > 0) ifTrue: [ html span class: 'inverted'; with: (arrTests at: 1) greaseString. html space.
								html span class: 'failed-back'; with: (arrTests at: 2) greaseString . html space.
								html span class: 'passed-back'; with: (arrTests at: 3) greaseString . html space.
								]
							]
						]
				]
			]
		]
	]
