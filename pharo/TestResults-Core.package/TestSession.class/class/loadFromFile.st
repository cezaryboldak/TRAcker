initialization
loadFromFile
	"Open file dialog to select a file to load from "

	|fileReference|
	fileReference := Smalltalk ui theme chooseFileIn: World title: 'Choose file with test results' extensions: #('txt') path: '/home/echo/Nauka/SE/Testing' preview:nil.
	 "UIManager default chooseFileMatching: #('*.txt') label:  'Select a file with test results'".
	fileReference isNil ifFalse:
		[ ^ self loadFromFile: fileReference ]