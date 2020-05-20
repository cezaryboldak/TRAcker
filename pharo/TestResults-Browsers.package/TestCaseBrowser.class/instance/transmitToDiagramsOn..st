initialization
transmitToDiagramsOn: composite
	| composer offsetX offsetY inRow counter max min |
	inRow := 5.
	composite table
		title: 'Characteristics';
		act: self exportCoverageBlock  icon: GLMUIThemeExtraIcons glamorousSave entitled: 'Save coverage';
		when: [ :relations :size :mode | (relations isNotNil) and: (size isNotNil) ];
		display: [ :relations :size :mode |  | combinations |
			combinations := (relations combinations select: [ :c | c size = size ]).
			combinations ];
		allowNil;
		column: 'Requirements' evaluated: [ :combination | |desc| desc:= String streamContents: [ : stream | |sep| sep:=''.combination do: [ :c | stream nextPutAll:(sep,c asString).sep:=',' ] 	].] width: 150;
		column: '|TC(x)|' evaluated: [ :combination | session TCCount: combination ] width: 50 ;
		column: '|TCFail(x)|' evaluated: [ :combination | session TCFailCount: combination  ] width: 70; 
		column: '|TCPass(x)|' evaluated: [ :combination | session TCPassCount: combination  ] width: 70; 
		column: '|TC(x,+)|' evaluated: [ :combination | session TCPlusCount: combination  ] width: 50;
		column: '|TCFail(x,+)|' evaluated: [ :combination | session TCPlusFailCount: combination ] width: 80; 
		column: '|TCPass(x,+)|' evaluated: [ :combination | session TCPlusPassCount: combination ]width: 80;
		column: 'Rel' evaluated: [ :combination | |rel| rel := session Reliability: combination. rel ifNil: [ '' ] ifNotNil: [ rel asFloat ] ] width: 50;
		column: 'DBR' evaluated: [ :combination | |dbr| dbr := session DBR: combination. dbr ifNil: [ '' ] ifNotNil: [ dbr asFloat ]  ] width: 50;
		column: 'DFE' evaluated: [ :combination | |dfe| dfe := session DFE: combination. dfe ifNil: [ '' ] ifNotNil: [ dfe asFloat ] ]width: 50;
		column: 'DSI' evaluated: [ :combination | |dsi| dsi := session DSI: combination. dsi ifNil: [ '' ] ifNotNil: [ dsi asFloat ] ]width: 50;
		column: 'DFOrder' evaluated: [ :combination | |dfo| dfo := session DFOrder: combination. dfo ifNil: [ '' ] ifNotNil: [ dfo asFloat ] ] width: 80
		.
	composite roassal2
		title: 'Tests';
		initializeView: [ composer := RTComposer new. composer gap: 60. composer view];
		painting: [ :view :relations :size :mode| | combinations testSelector elements sizes |
			elements := Bag new.
			(mode = #NETTO) ifTrue: [ testSelector := #resultsNetto: ].
			(mode = #PLUS) ifTrue: [ testSelector := #resultsPlus: ].
			combinations := (relations combinations select: [ :c | c size = size ]) 
					reject: [:c | (session perform: testSelector with: c) size = 0 ].
			(combinations size > 0) ifTrue: [ 
				sizes := Dictionary new.
				combinations do: [ :combination | |pie results |
					results := session perform: testSelector with: combination .
					sizes at: combination put: results size.
					pie := RTPieBuilder new.
					pie view: view.
					pie objects: (Array with:( Array with:#OK with: combination with: results) with: (Array with: #FAILED with: combination with: results)).
					pie interaction popupText: [:struct | |testResult| testResult:=struct first. testResult,'-',(results count: [:res| res result = testResult]) asString]. 
					pie slice: [:struct | |testResult| testResult:=struct first. results count: [ :res | res result = testResult ] ] .
					pie normalizer
						"normalizeSize: [ :res | res third size *50 ] min: 50 max: 200;"
						normalizeColor: [:struct | |testResult| testResult:=struct first. (testResult=#OK) ifTrue: [ 1 ] ifFalse: [ 2 ] ] using: (Array with: Color green with: Color red);
						build.
					pie build.
					composer group: combination.
					elements add: (composer getGroup: combination) . 
				].
				"composer  setGeneralTitle: 'RELATIONS' gap: 0@0."
				offsetX := 0.
				offsetY := 0.
				counter := 0.
				min := sizes values min. max := sizes values max.
				combinations do: [ :combination |  | label desc scale |
					desc := String streamContents: [ : stream | |sep| sep:=''.combination do: [ :c | stream nextPutAll:(sep,c asString).sep:=',' ] 	].
					(composer getGroup: combination) translateBy: offsetX@offsetY.
					scale :=  ((sizes at: combination) / max) max: 0.2.
					(composer getGroup: combination) do: [ :el | el scaleBy: scale ].
					label := (RTLabel new text: desc) element. label translateTo: offsetX@(offsetY-100). view add: label. 
					offsetX := offsetX + 200.
					counter := counter + 1.
					(counter % inRow == 0) ifTrue: [ offsetX := 0. offsetY := offsetY + 200. ].
				].
			].
			view .
			] 