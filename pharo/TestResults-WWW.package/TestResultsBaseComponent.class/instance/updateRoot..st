updating
updateRoot: htmlRoot
	super updateRoot: htmlRoot .
	htmlRoot beHtml5.
	htmlRoot stylesheet url: (WAUrl absolute: TestResultsMainComponent getMdlCssUrl ).
	 "'https://storage.googleapis.com/code.getmdl.io/1.3.0/material.XXX-YYY.min.css'"