calculations
countSelectPhrases
	"counts phrases in SELECT statement separated by ANDs"
	"| posSelect posSuch phrase small |
	small := text asLowercase. 
	posSelect := small findString: 'select'.
	posSuch := small findString: 'such' startingAt: posSelect.
	phrase := ((posSuch > 0) ifTrue: [ small copyFrom: posSelect to: posSuch ] ifFalse: [ small copyFrom: posSelect  ]).
	
	^ (phrase substrings count: [ :token | token = 'and' ]) +1
	"
	^ (text asLowercase substrings count: [ :token | token = 'and' ]) +1
	