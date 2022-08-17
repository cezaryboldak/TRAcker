files
demoTCNeededTxt
   | crlf |
   crlf := Character cr asString, Character lf asString.
	^ 'Parent	10',crlf,
'Follows	20',crlf,
'Uses	20	',crlf,
'Affects	30	',crlf,
'Parent,Follows	30	',crlf,
'Parent,Uses	30	',crlf,
'Parent,Affects	40	',crlf,
'Follows,Uses	50	',crlf,
'Follows,Affects	50	',crlf,
'Uses,Affects	60	',crlf,
'Parent,Follows,Uses	100	',crlf,
'Parent,Follows,Affects	120',crlf,
'Parent,Uses,Affects	150',crlf
