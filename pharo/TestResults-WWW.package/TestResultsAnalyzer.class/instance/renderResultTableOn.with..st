rendering
renderResultTableOn: html with: headers
| tableHeaders jsFunction |

 self renderResultTableInfoOn: html.
 tableHeaders := (headers collect: [ :comb | MDLSortableTableHeaderNumeric for: comb value ]) asOrderedCollection. 
 tableHeaders addFirst: 'Req. Config.' . 
 tableHeaders := tableHeaders asArray.
	
 "html paragraph: 'Double click to see more: '."
 html div: [ 	
 html table: [ html tableRow: [ html tableData class: 'allRequiredPassed'; with: 'all passed and sufficiently covered'.  html tableData class: 'allPassedButMissing'; with: 'all passed but NOT sufficiently covered'.
		html tableData class: 'mostPassed'; with: 'more passed than failed'. html tableData class: 'mostFailed'; with: 'more failed than passed'. html tableData class: 'allFailed'; with: 'all failed' ] ] ].

html div:
			(CustomizedMDLSortableTable  new
				headers: (headers collect: [ :pair | pair key ]) ;
				parentComponent: self; 
				selectable: true;
				header: tableHeaders;
				rows: [ 
					((self heuristics 
						select: [ :row | | req | req := row at: #Req. (req isEmpty) or: [ (req intersection: self session chosenRequirements) isNotEmpty ] ] )
						reject: [ :row  | | req | req := row at: #Req. (req isNotEmpty) and: [ (req intersection: self session excludingRequirements) isNotEmpty ] ] )
						collect: [ :row | | coll | 
							coll:= (headers collect: [ :comb |  (row at: comb key) ifNotNil: [ self numberFormat: (row at: comb key) ] ])  asOrderedCollection. 
							coll addFirst: (self reqFormat: (row at: #Req)). 
							coll asArray ] 
				];
				rowsPerPagePossibilities: #(10 50 100 200)).
jsFunction := JSFunction new arguments: { 'td' }; add: (JSStream on: 'return td.innerHTML'); yourself.
html div:
[html mdlAnchorButton accentColor ; raised;
   onClick:(html jQuery ajax callback:[ :val | combinationsForCharts := val ] 
									 value: ((((html jQuery class:'combinationRow.is-selected') children: 'td:nth-child(2)') toArray map: jsFunction   )));
	callback: [ self call: (TestResultsCharts new combinations: combinationsForCharts) ];
	with: 'Show charts ...']
