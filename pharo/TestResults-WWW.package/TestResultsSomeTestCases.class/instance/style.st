hooks
style 
	^ '
	.ok { background-color: lawngreen; }
	.failed { background-color: tomato; }
	.exception {  background-color: violet; }
	.timeout {  background-color: yellow; }
	.crash { background-color: orange; }
	.unknown { background-color: beige; }
	.ok-hidden { display: none; }
	.failed-hidden { display: none; }
	.exception-hidden {  display: none; }
	.timeout-hidden {  display: none; }
	.crash-hidden { display: none; }
	.unknown-hidden { display: none; }
	.requirement-hidden { display: none;  }
	span>span.mdl-chip__contact { background-color: #ffffff; }
	span.includingReqsFilter.requirement-marked>span.mdl-chip__contact { background-color: #00ffff; color: white; }
	span.excludingReqsFilter.requirement-marked>span.mdl-chip__contact { background-color: #000000; color: white; }
	a {  color: blue; }
	'