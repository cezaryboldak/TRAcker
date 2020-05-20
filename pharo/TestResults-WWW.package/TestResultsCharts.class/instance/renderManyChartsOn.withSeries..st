rendering
renderManyChartsOn: html withSeries: data 
	html table: [ 
		data readStreamDo: [ :stream | | dataSeries name |
			[ stream atEnd ] whileFalse: [  
				html tableRow: [ 
					3 timesRepeat: [ 
						stream atEnd ifFalse: [ 
							dataSeries := stream next.
							html tableData: [ 
								name := dataSeries at: 1.
								html div script: (self createChartNamed: name withData: dataSeries allButFirst on: html)
							]
						]
					]
				]
			]
		] 
	].
	
