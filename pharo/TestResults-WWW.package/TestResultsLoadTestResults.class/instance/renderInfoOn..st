rendering
renderInfoOn: html 
   | stdReqSetAsString |
	html mdlExpansionPanel
		fold;
		with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ html mdlExpansionPanelHeaderTitle with:[ html heading level3; with: 'Set up TRAcker' ].
					html mdlIcon with: 'info'.
					html mdlExpansionPanelHeaderIcon ].
			html
				mdlExpansionPanelContent: [ 
					html heading level:4; with: 'Requirement set (optional)'.
					stdReqSetAsString := String streamContents: [ :stream | TestSession SPADefaultRequirements keysAndValuesDo: [ :req :catRegexp | stream nextPutAll: (req asString, ' ', (catRegexp at: 1) asString, ' ', (catRegexp at: 2), Character cr asString)   ] ].
					html paragraph: 'TRAcker allows to load a custom requirement set in form of a text file. If not uploaded, the SPA default requirement set will be used: '.
					html preformatted: stdReqSetAsString .
					html paragraph: 'In this file, description of each requirements is placed in a separate line. This description consists of (1) the requirement name, followed by (2) requirement category and (3) the regular expression used to search the test description (see below) in order to map tests to this requirement. The trequirement names should be unique (case sensitive).'.

					html heading level:4; with: 'TCNeeded values (optional)'.
					html paragraph: 'TRAcker allows to load a custom TCNeeded values in form of a text file. If not uploaded, the values calculated from the requirement count in every requirement set will be used.'.
					html paragraph: 'In this file, in every line a requirement set (comma-separated, analyzed with regular expressions) is followed by the TAB character and by the TCNeeded value.'.


					html heading level:4; with: 'Test results (obligatory)'.
					html paragraph: 'TRAcker reads the test results from an uploaded text file (e.g. produced from the PipeTester tool). Every test result is placed in separate line and composed of fields separated with a TAB character (ASCII 9):'. 
					html unorderedList: [ 
						html 
							listItem: 'test numerical index';
							listItem: 'test description (test-to-requirements mapping) - a text searched with requirement regular expressions (see above) to map this test to specific requirements';
							listItem: 'test expected result';
							listItem: 'test actual result';
							listItem: 'test status (case ignored - OK, Fail, Timeout, Exception, Crash, Unknown)';
							listItem: 'test time 1 - not used';
							listItem: 'test time 2 - not used';
							listItem: 'number 1 - not used';
							listItem: 'number 2 - not used';
							listItem: 'number 3 - not used';
							listItem: 'number 4 - not used'.
					].
					html paragraph: 'Example:'.
					html preformatted: '1	stmt s; Select s such that Follows (15, s)	none	none	OK	0,000	0,000	1	0	0	100', Character cr asString, '2	stmt s; Select s such that Follows (s, 69)	68	68	OK	0,000	0,000	1	0	0	100', Character cr asString, '176	procedure p; Select p such that Calls* ("RR", p)	PP,QQ	PP,QQ,SS,TT,UU,XX	Fail	0,000	0,000	2	0	4	33,3333333333333'.
					html horizontalRule.

				]
		]