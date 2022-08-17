files
demoRequirementsTxt
   | crlf |
   crlf := Character cr asString, Character lf asString.
	^ 'Parent Relations \bParent\b', crlf, 'Follows Relations \bFollows\b',  crlf, 'Uses Relations \bUses\b',  crlf, 'Affects Relations \bAffects\b',  crlf
