rendering
renderSubContentOn: html 
	| data keys |
	html mdlCell size:12; with: [ html heading level:3; with: 'Charts' ].
	html mdlCell size:12; with: [ self renderChartsInfoOn: html title: combinations asText ].
	
	data := self createDataSeriesOnModes.
	
	keys := Array with: 'NETTO' with: 'BRUTTO' with: 'PLUS'.
	html mdlCell size:12; with: [ 
		html mdlTabs
			with: [ | tabIds |
				tabIds := Dictionary new.
				html
					mdlTabBar: [ 
							keys do: [ :key | 
								html mdlTab
									url: '#' , (tabIds at: key ifAbsentPut: [ html nextId ]);
									isActiveIf: (keys indexOf: key) = 1;
									with: key ] ].
			keys do: [ :key | 
				html mdlTabsPanel
					id: (tabIds at: key);
						isActiveIf: (keys indexOf: key) = 1;
							with: [
								html heading level: 2; style: 'display:none';with:  key.
								self renderSingleChartsOn: html withSeries: data mode: key.
								] 
				] 
			]
		].	

	html mdlCell size:12; with: [ html mdlAnchorButton accentColor; raised; rippleEffect; callback: [ self answer ]; with: 'Close'  ].
