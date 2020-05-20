initializing
initFromFile: filename
	"load a test session result from a file produced from PipeTester screen (via copy paste) "

	tests := OrderedCollection new.
	testResults := OrderedCollection new.
	description := filename.
	filename asFileReference
		readStreamDo: [ :readStream | 
			self initFromStream: readStream
		].
	^ self