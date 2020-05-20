initializing
initFromWAFile: waFile
	"load a test session result from a file produced from PipeTester screen (via copy paste) "

	description := waFile fileName.
	self initFromStream: (ReadStream on: waFile rawContents ).
