Presents test cases from a session passed as an open parameter.
Session can be created by from PipeTester test table by copying and pastinginto a text file.
Usage:

	TestCaseBrowser open "session are loaded from a text file"
or 
	TestCaseBrowser openOn: session.

The first is equivalent to:
	TestCaseBrowser openOn: TesResultSession loadFromFile

