initialization
loadFromXMLFile: filename
	"load a test session result from an XML file produced by SPA with integrated AutoTester 
	(before PipeTester and from NUS)"
	^ self new initFromXMLFile: filename

