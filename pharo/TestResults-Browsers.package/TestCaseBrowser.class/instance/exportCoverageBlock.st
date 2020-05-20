exporting
exportCoverageBlock
	"returns block exporting coverage of marked relations to a selected file"
	
	^ [ :presentation :relations :size :mode | |fileName combinations |
			combinations := (relations combinations select: [ :c | c size = size ]).
			fileName := Smalltalk ui theme fileSaveIn: World title: 'Choose file name to export requirements test statistics ' extensions: #('txt' 'csv') path: '/home/echo/Nauka/SE/Testing'.
			fileName isNotNil ifTrue: [ 
				FileStream forceNewFileNamed: fileName do: [ :stream |
					stream nextPutAll: 'Requirements x;|TC(x)|;|TCFail(x)|;|TCPass(x)|;|TC(x,+)|;|TCFail(x,+)|;|TCPass(x,+)|;|BD|;DBR;DFE;DSI;DFOrder'; cr.
					combinations do: [ :combination  | |desc| 
						desc:= String streamContents: [ : stringStream | |sep| sep:=''.combination do: [ :c | stringStream nextPutAll:(sep,c asString).sep:=',' ] 	].
						stream nextPutAll: desc  ; nextPutAll: ';';
							nextPutAll: (session TCCount: combination ) asString; nextPutAll: ';';
							nextPutAll: (session TCFailCount: combination ) asString; nextPutAll: ';';
							nextPutAll: (session TCPassCount: combination ) asString; nextPutAll: ';';
							nextPutAll: (session TCPlusCount: combination ) asString; nextPutAll: ';';
							nextPutAll: (session TCPlusFailCount: combination ) asString; nextPutAll: ';';
							nextPutAll: (session TCPlusPassCount: combination ) asString; nextPutAll: ';';
							nextPutAll: (session baselineDefectCount: combination ) asString; nextPutAll: ';';
							nextPutAll: (session DBR: combination ) asString; nextPutAll: ';';
							nextPutAll: (session DFE: combination ) asString; nextPutAll: ';';
							nextPutAll: (session DSI: combination ) asString; nextPutAll: ';';
							nextPutAll: (session DFOrder: combination ) asString  ;  cr.
						]
					 ] 
				 ]
		]
