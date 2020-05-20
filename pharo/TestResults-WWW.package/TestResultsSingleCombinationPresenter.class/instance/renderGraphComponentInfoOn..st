rendering
renderGraphComponentInfoOn: html
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle with: [
						html heading level5; with: 'Baseline and R+ configurations'. 
					].
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent class: 'help'; with: [ 
					html paragraph: 'On this chart the selected requirement configuration R (in the middle) is connected with configurations from its baseline (on the left) and from R+ (on the right).'.
					html paragraph: 'The connections are colored in function of Reliability of the baseline and R+ configurations: from red (Rel=0) to green (Rel=1)'.
					html paragraph: 'The configuration labels (in {}) are active - after double clicking the clicked requirement configurations will be presented.'.
					html paragraph: [ html span: 'The chart can be printed or exported to PNG, SVG, or JPEG files by clicking '. html mdlIcon: 'dehaze' ]					
				]
			]