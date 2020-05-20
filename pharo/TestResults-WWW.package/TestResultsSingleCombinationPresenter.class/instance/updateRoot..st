hooks
updateRoot: htmlRoot
	super updateRoot: htmlRoot .
   htmlRoot script url: (WAUrl absolute: 'https://code.highcharts.com/8.0.0/modules/sankey.js').
