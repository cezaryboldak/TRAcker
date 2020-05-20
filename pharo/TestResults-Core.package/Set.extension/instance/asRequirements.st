*TestResults-Core
asRequirements
   | first |
   first := true.
	^ String streamContents: [ :stream | 
		stream nextPutAll: '{'.
		self do: [ :r | 
			first ifTrue: [ first:=false ] ifFalse: [ stream nextPutAll: ',' ].
			stream nextPutAll: r greaseString 
		] .
		stream nextPutAll: '}'
	] .