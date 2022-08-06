files
demoTCNeededTxt
   | crlf |
   crlf := Character cr asString, Character lf asString.
	^ 'r1	10',crlf,
'r2	20',crlf,
'r3	20	',crlf,
'r4	30	',crlf,
'r1,r2	30	',crlf,
'r1,r3	30	',crlf,
'r1,r4	40	',crlf,
'r2,r3	50	',crlf,
'r2,r4	50	',crlf,
'r3,r4	60	',crlf,
'r1,r2,r3	100	',crlf,
'r1,r2,r4	120',crlf,
'r1,r3,r4	150',crlf
