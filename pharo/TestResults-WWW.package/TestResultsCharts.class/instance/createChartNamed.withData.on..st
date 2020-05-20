generating
createChartNamed: name withData: data on: html
	| chart title series | 
	
	chart := html highcharts newChart.
	chart chart type: 'pie'.
	title := String streamContents: [ :stream |
		stream nextPutAll: '{'.
		name do: [ :req | stream nextPutAll: req asString ].
		stream nextPutAll: '}'.
		].
	chart title text: title.
	series := (chart addSeriesOf: HighchartsSeriesPie)
		name: name;
		data: data;
		yourself.
	^ chart