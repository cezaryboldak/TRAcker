initialization
loadFromXMLFile
	"Open file dialog to select a file to load from - XML version"

	|fileReference|
	fileReference := Smalltalk ui theme chooseFileIn: World title: 'Choose XML file with test results' extensions: #('xml') path: '/home/echo/Nauka/SE/Testing' preview:nil.
	 "UIManager default chooseFileMatching: #('*.txt') label:  'Select a file with test results'".
	fileReference isNil ifFalse:
		[ ^ self loadFromXMLFile: fileReference ]