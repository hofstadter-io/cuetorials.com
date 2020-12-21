// a mathematically valid releationship
// but invalid in Cue until one or the other has a value
a: b - 10
b: a + 10

// we need to set a or b and Cue will do the rest
// if not, a cycle error will be reported
a: 100
