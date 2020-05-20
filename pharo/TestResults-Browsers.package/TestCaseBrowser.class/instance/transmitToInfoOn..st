initialization
transmitToInfoOn: composite
	composite table title: 'Tests';
		column: 'nr' evaluated: [ :testResult | testResult test number ] width: 20;
		column: 'text' evaluated: [ :testResult | testResult test text ] width: 300;
		column: 'result' evaluated: [ :testResult | testResult result ] width: 40;
		column: 'requ.' evaluated: [ :testResult | testResult test requirements ] width: 150;
		column: 'corr. ans.' evaluated: [ :testResult | testResult test answer ] width: 150;
		column: 'answer' evaluated: [ :testResult | testResult answer ] width: 150;
		display: [ :struct | struct third . ];
		textBackgroundColor: [ :res | (res result = #OK) ifTrue: [ Color green ] ifFalse: [ Color red ] ].
"	composite text title: 'Metrics';
	display: [:struct | struct ] ;
	format: [ :s | s ] "
