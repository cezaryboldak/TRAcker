rendering
renderModeTabsForConfiguration: reqSet with: testResults on: html
	| exactCount plusCount |
		
	exactCount := testResults count: [ :tr | tr test requirements = reqSet ].
	plusCount := testResults size - exactCount.

	html mdlTabs
		with: [ | tabIds |
			tabIds := Dictionary new.
			html
				mdlTabBar: [ 
						html mdlTab	onClick: (html jQuery script: [ :s | s << (s jQuery: 'tr.exact') show. s << (s jQuery: 'tr.plus') hide ]); isActiveIf: mode='NETTO'; url: '#netto-panel'; with: 'NETTO'.
						html mdlTab	onClick: (html jQuery script: [ :s | s << (s jQuery: 'tr.exact') show. s << (s jQuery: 'tr.plus') show ]); isActiveIf: mode='BRUTTO'; url: '#brutto-panel'; with: 'BRUTTO'.
						html mdlTab	onClick: (html jQuery script: [ :s | s << (s jQuery: 'tr.exact') hide. s << (s jQuery: 'tr.plus') show ]); isActiveIf: mode='PLUS'; url: '#plus-panel'; with: 'PLUS'.
					
				].
			html mdlTabsPanel id: 'netto-panel'; isActiveIf: mode='NETTO'; with: [ html heading level:3; with: 'Test cases tagged by exactly ',  (row at: 1), ' - ', exactCount asString, ' test(s)' ].
			html mdlTabsPanel id: 'brutto-panel'; isActiveIf: mode='BRUTTO'; with:  [ html heading level:3; with: 'Test cases tagged by ',  (row at: 1), ' and possibly yet other requirements - ', (exactCount+plusCount) asString, ' test(s)' ].
			html mdlTabsPanel id: 'plus-panel'; isActiveIf: mode='PLUS'; with: [  html heading level:3; with: 'Test cases tagged by ',  (row at: 1), ' and at least one yet other requirement - ', plusCount  asString, ' test(s)' ].
	].