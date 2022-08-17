initializing
requirementsFromFile: aFile 
	"constructs a dict of requirements read from aFile (name + category + reg expression per line) and sets this dict as requirements"
	| reqDict lineReader line symbol category regexp collection |

	reqDict := Dictionary new.
		
	lineReader := ZnLineReader on: (ReadStream on: aFile rawContents).
	lineReader limit: 16777216.
	[ (line := lineReader nextLine trimBoth) isEmpty ]
		whileFalse: [ 
			collection := line splitOn: [ :each | each isSeparator  ].
			(collection size >= 3) ifTrue: [ 
				symbol := (collection at: 1) asSymbol.
				category :=  (collection at: 2) asSymbol.
				regexp := collection at: 3.
				reqDict  at: symbol put: (Array with: category with: regexp).
			]
		].
   
	self requirements: reqDict