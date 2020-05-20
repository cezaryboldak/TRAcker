rendering
getRelColorString: reliability
	"returns hex encoded string for reliability - number (0,1) on red-green color scape"
	| relInt res |
	relInt := ((255*reliability) rounded min:255) max: 0.
	res := String streamContents: [ :stream | stream << '#' << ((255-relInt) printStringBase: 16 nDigits: 2) << (relInt printStringBase: 16 nDigits: 2) << '00'  ].
	^ res 