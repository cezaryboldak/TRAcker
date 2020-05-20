calculation
baseline: combination
	"Returns sub-combinations"
	^ combination combinations reject: [ :c | c size = combination size ]
	