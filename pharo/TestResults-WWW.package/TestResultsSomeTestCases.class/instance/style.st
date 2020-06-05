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
	a {  color: blue; }
	'