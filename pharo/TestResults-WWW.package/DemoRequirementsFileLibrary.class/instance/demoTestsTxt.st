files
demoTestsTxt
   | crlf tab stream nr testsInfo |
	"r1 - Parent r2 - Follows r3 - Uses r4 - Affects"
   crlf := Character cr asString, Character lf asString.
	tab := Character tab asString.
	"configuration TC TCPass TCFail"
	testsInfo := #(	#('Parent' 15 15 0) #('Follows' 15 15 0) #('Uses' 15 13 2) #('Affects' 30 15 15) #('Parent,Follows' 25 25 0) #('Parent,Uses' 20 17 3) #('Parent,Affects' 5 0 5) #('Follows,Uses' 40 39 1) #('Follows,Affects' 15 0 15) #('Uses,Affects' 30 2 28) #('Parent,Follows,Uses' 20 15 5) #('Parent,Follows,Affects' 20 1 19) ).
	stream := String new writeStream.
	nr := 0.
	
	testsInfo do: [ :tests | | conf tc tcpass tcfail | 
		conf := tests at: 1.
		tc := tests at: 2.
		tcpass := tests at: 3.
		tcfail := tests at: 4.
		
		1 to: tcpass do: [ :i |
			nr := nr + 1.
			stream print: nr; nextPutAll: tab, conf, '-', nr asString, tab, 'a', tab, 'a', tab, 'OK', tab, '0', tab, '0', tab, '0', tab, '0', tab, '0', tab, '0', tab, crlf.
			 ].
		1 to: tcfail do: [ :i |
			nr := nr + 1.
			stream print: nr; nextPutAll: tab, conf, '-', nr asString, tab; print: 'a', tab, 'b', tab, 'Fail', tab, '0', tab, '0', tab, '0', tab, '0', tab, '0', tab, '0', tab, crlf.
			 ]
		].
	
	 ^ stream contents.