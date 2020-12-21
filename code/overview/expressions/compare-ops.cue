// number constraints
positive: >0  // numbers
doubledig: >=10 & <100 & int

// lexical comparison
lowercase: >="a" & <="z"

notone: <1 | >1
notone: 1  // error, empty disjuntion
