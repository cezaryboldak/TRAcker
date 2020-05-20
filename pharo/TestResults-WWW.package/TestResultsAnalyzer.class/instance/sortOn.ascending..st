sorting
sortOn: key ascending: asc
	heuristics := key = #Size
		ifTrue: [ self session testSession heuristics
				sorted: [ :a :b | 
					| x y |
					x := (a at: #Req) size.
					y := (b at: #Req) size.
					asc ifTrue: [x < y] ifFalse: [ x>y ] ] ]
		ifFalse: [ self session testSession heuristics
				sorted: [ :a :b | 
					| x y |
					x := a at: key.
					y := b at: key.
					x ifNil: [ x := 1000 ]. y ifNil: [ y:=1000 ].
					asc ifTrue: [x < y] ifFalse: [ x>y ] ] ]
