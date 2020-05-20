rendering
renderContentOn: html 
	| chart data series linkId clickedReq reqId myLabel |
	
	myLabel := reqSet asRequirements .
	
	chart := html highcharts newChart.
	chart chart type: 'sankey'.
	chart title text: '.'.
	chart chart styledMode: false.
	
	data := self produceReqConfigurationData.
	
	series := chart addSeriesOf: HighchartsSeriesSankey.
	series data: data.
	series dataLabels style fontSize: '16px' .
	series nodes add: (HighchartsSeriesSankeyNodes new colorIndex: 200; id: myLabel; name: myLabel; color: (self getRelColorString: (self session testSession Reliability: reqSet)); yourself).
			
	linkId := html nextId.
	reqId := html nextId. 
	chart chart events: (HighchartsChartEvents new load: (JSStream on: 'function() {  $(".highcharts-data-label").dblclick(function() {var req=$(this).find("tspan:first").text(); $("#',reqId,'").text(req); $("#',linkId,'").click();document.location=$("#',linkId,'")[0].href;}) }')).
	
	chart tooltip enabled: false.

	self renderChart: chart on: html. 	
	clickedReq := nil.	
	html span id: reqId; style: 'display:none;'; with: ''.
	html anchor callback: [ self answer: clickedReq ]; style: 'display: none;'; id: linkId; 
		   onClick:(html jQuery ajax callback:[ :val | clickedReq := Set fromString: val ] value: ((html jQuery id: reqId ) text));
		with: 'hidden'