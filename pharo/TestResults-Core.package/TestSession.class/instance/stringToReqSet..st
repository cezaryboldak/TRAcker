utility
stringToReqSet: string
	" converts string to the set of requirement symbols, using 'requirements' collection "	
			
	| set |
	set := Set new.
	requirements keysAndValuesDo: [ :req :catRegexp |
			((catRegexp second) asRegexIgnoringCase search: string) ifTrue: [ set add: req asSymbol ]
		 ]. 
	
   ^ set