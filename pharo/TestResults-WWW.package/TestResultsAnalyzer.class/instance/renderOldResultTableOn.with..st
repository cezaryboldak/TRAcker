rendering
renderOldResultTableOn: html with: headers
	html table class: 'blueTable'; with: [  
		html tableHead: [ 
			html tableRow: [ html tableHeading: 'Requirements'.  headers do: [ 
					:comb | html tableHeading: [  
						html anchor
							class: (((sortKey = comb) & ascending) ifTrue: [ 'chosen' ] ifFalse: [ '' ]);
						 	callback: [ self sortOn: comb ascending: true. sortKey:= comb. ascending := true ];
						 	with: '<'.
						html space. 
						html text: comb asString.
						html space. 
						html anchor  
							class: (((sortKey = comb) & ascending not) ifTrue: [ 'chosen' ] ifFalse: [ '' ]);
							callback: [ self sortOn: comb ascending: false. sortKey:=comb. ascending:=false ];
							with: '>'.
							 ] ] ].
		].
		html tableBody: [ 
			heuristics do: [ :row | 
				html tableRow: [ 
					html tableData: (self reqFormat: (row at: #Req)).
					headers do: [ :h | html tableData: ((row at: h) ifNotNil: [ (row at: h) asFloat roundTo: 0.001 ]) ]
				]
			]
		]
	].
	