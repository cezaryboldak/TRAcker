rendering
renderSingleChartsOn: html withSeries: data mode: mode
	| width height chart title col row rowNumber chartsPerRow annotation label pieSize id reqId linkId clickedReq jsStream |
	
	id := html nextId.		
	reqId := html nextId.
	linkId := html nextId.
	html span id: reqId; style: 'display:none;'; with: ''.
	pieSize := self class getPieSize.
	chart := html highcharts newChart.
	chart chart type: 'pie'.
	
	chart plotOptions pie size: self class getPieSize greaseString,'px'.
	chart plotOptions pie dataLabels enabled: false.
	annotation := HighchartsAnnotations new.
	chart annotations add: annotation.

	col := 0. 	row := 0.	 	chartsPerRow := 5.
	rowNumber := (data size / chartsPerRow) roundUpTo: 1.
	
	jsStream := String new writeStream.
	jsStream nextPutAll: 'var id2Req = { '.
	data doWithIndex: [ :seriesCol :index | | series |
		col := (index-1) % chartsPerRow.
		row := ((index-1) / chartsPerRow) roundDownTo: 1.
		title := String streamContents: [ :stream | ((seriesCol at: 1) isEmpty) ifTrue: [ stream nextPutAll: '.' ] ifFalse: [ stream nextPutAll: (',' join: ((seriesCol at: 1) collect: [ :req | req asString ]))].].
		jsStream nextPutAll: ((index-1) greaseString); nextPutAll: ':"{'; nextPutAll: title; nextPutAll: '}",'.
		series := (chart addSeriesOf: HighchartsSeriesPie)
			name: title;
			data: ((seriesCol at: 2) at: mode) ;
			center: (JSStream on: '["',((100/(chartsPerRow min: data size) /2  + (col*100/(chartsPerRow min: data size) )) roundDownTo: 1) greaseString,'%","',((100/rowNumber/2+(row*(100/rowNumber))) roundDownTo: 1) greaseString,'%"]');
			yourself.
		label := HighchartsAnnotationsLabels new text: title asString;  shape: 'rect'; className: ('link',mode, ' link'); yourself.
		label point x: (col*(pieSize+85))+(pieSize /1.5); y: 20+(row*(pieSize+95)).
		label style: (HighchartsCustomStyle new addProperty: 'fontSize' withValue:'20px'; addProperty: 'fill' withValue: '#000000'; addProperty: 'color' withValue: 'black').
		annotation labels add: label.		
	].
	jsStream nextPutAll: '};'.
	chart chart events: (HighchartsChartEvents new load: (JSStream on: 'function() {   $(".link',mode,'").find("text").each(function(i,v) {var t=$(v).text(); if(t!=".") {$(v).text("{"+t+"}");} else {$(v).text("{}");}} ); $("div.mdl-tabs__panel.is-active g.highcharts-pie-series").dblclick(function() {',jsStream contents,'var cl=$(this).attr("class"), key="highcharts-series-", pos=cl.indexOf(key), req=id2Req[parseInt(cl.substring(pos+key.length,pos+key.length+2))];  $("#',reqId,'").text(req); $("#',linkId,'").click();document.location=$("#',linkId,'")[0].href;})}')).

	height := rowNumber * (self class getPieSize + 100).
	width := (chartsPerRow min: data size)  * (self class getPieSize + 100).
	chart id: id.
	html div id: id;style: 'min-width: ',width greaseString,'px; min-height: ',height greaseString, 'px; width: ',width greaseString,'px; height: ',height greaseString, 'px';  script: chart.
	
	html anchor callback: [ self call: (TestResultsSingleCombinationPresenter new row: { clickedReq } ; mode: mode; yourself ) ]; style: 'display: none;'; id: linkId; 
		   onClick:(html jQuery ajax callback:[ :val | clickedReq := val ] value: ((html jQuery id:reqId ) text));

		with: 'hidden'.
	
