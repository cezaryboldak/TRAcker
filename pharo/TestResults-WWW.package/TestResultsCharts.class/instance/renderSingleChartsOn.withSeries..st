rendering
renderSingleChartsOn: html withSeries: data 
	| width height chart title col row rowNumber chartsPerRow annotation label pieSize |
		
	pieSize := self class getPieSize.
	chart := html highcharts newChart.
	chart chart type: 'pie'.
	"chart title text: combinations ."
	chart plotOptions pie size: self class getPieSize greaseString,'px'.
	chart plotOptions pie dataLabels enabled: false.
	annotation := HighchartsAnnotations new.
	chart annotations add: annotation.

	col := 0. 	row := 0.	 	chartsPerRow := 3.
	rowNumber := (data size / chartsPerRow) roundUpTo: 1.
	data doWithIndex: [ :seriesCol :index | | series |
		col := (index-1) % chartsPerRow.
		row := ((index-1) / chartsPerRow) roundDownTo: 1.
		title := String streamContents: [ :stream | stream nextPutAll: ' '. stream nextPutAll: (',' join: ((seriesCol at: 1) collect: [ :req | req asString ])). stream nextPutAll: ' ' ].
		series := (chart addSeriesOf: HighchartsSeriesPie)
			name: title;
			data: seriesCol allButFirst  ;
			center: (JSStream on: '["',((100/(chartsPerRow min: data size) /2  + (col*100/(chartsPerRow min: data size) )) roundDownTo: 1) greaseString,'%","',((100/rowNumber/2+(row*(100/rowNumber))) roundDownTo: 1) greaseString,'%"]');
			yourself.
		label := HighchartsAnnotationsLabels new text: title asString;  shape: 'rect'; yourself.
		label point x: (col*(pieSize+85))+(pieSize /1.5); y: 20+(row*(pieSize+85)).
		label style: (HighchartsCustomStyle new addProperty: 'fontSize' withValue:'25px'; addProperty: 'fill' withValue: '#000000'; addProperty: 'color' withValue: 'black').
		annotation labels add: label.

		
	].
	height := rowNumber * (self class getPieSize + 100).
	width := (chartsPerRow min: data size)  * (self class getPieSize + 100).
	html div style: 'min-width: ',width greaseString,'px; min-height: ',height greaseString, 'px; width: ',width greaseString,'px; height: ',height greaseString, 'px';  script: chart.
	
