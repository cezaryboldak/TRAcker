Initialization
initialize 
	| app |
	app := WAAdmin register: self asApplicationAt: 'tracker'.
	app
	addLibrary: JQDeploymentLibrary;
	addLibrary: JQUiDeploymentLibrary;
	addLibrary: MDLLibrary;
	addLibrary: Highcharts8OnlineLibrary;
	preferenceAt: #sessionClass put: TestResultsHttpSession .