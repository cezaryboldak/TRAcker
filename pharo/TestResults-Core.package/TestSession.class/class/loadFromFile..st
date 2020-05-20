initialization
loadFromFile: filename
	"load a test session result from a file produced from PipeTester screen (via copy paste) "
	^ self new initFromFile: filename

