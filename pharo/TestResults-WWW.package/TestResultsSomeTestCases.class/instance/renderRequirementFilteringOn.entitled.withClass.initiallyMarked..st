rendering
renderRequirementFilteringOn: html entitled: aTitle withClass: aClass initiallyMarked: marked 
	| reqsByCategory |
		
	reqsByCategory := TestResultsHttpSession requirementsByCategory first.

	html heading level6 with: aTitle.
	reqsByCategory keysAndValuesDo: [ :category :categoryRequirements | 
				categoryRequirements ifNotEmpty: [  
					html emphasis: category greaseString. html text: ': '.
					categoryRequirements asOrderedCollection sort;  do: [ :req | html mdlChip 
															onClick: (html jQuery script: [ :s | s << (html jQuery this hasClass: 'requirement-marked') then: 
																(html jQuery this removeClass:'requirement-marked')
																 else:  
																(html jQuery this addClass:'requirement-marked').
																s << (JSStream on: 'showHideTestsFn();'). 
															]);
														   class: aClass; class: 'requirement-marked' if: marked;
															with: [  | reqText reqEnd |
																reqText := req greaseString.
																reqEnd := ((reqText last = $T) | (reqText last = $>)) ifTrue: [ reqText last asString ] ifFalse: [ '' ].
																html mdlChipContact with: (reqText at: 1) asString,reqEnd. 
																html mdlChipText with: req greaseString ] ].
					html break.
				]
			]
