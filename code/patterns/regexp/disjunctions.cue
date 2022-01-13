// The following errors (is that correct)
// 
#ID: !~"^a" | =~"^ab$" | =~"^aB$"
#ID: =~"^a" | !~"[A-Z]"

_IDExamples: [...#ID]
_IDExamples: [
  "xyz",
  "ab",
  "aB",
]

// https://cuelang.org/docs/references/spec/#disjunction

// Disjunction in CUE is a binary expression, written a | b. It is commutative, associative, and idempotent.

// The unification of a disjunction with another value is equal to the disjunction composed of the unification of this value with all of the original elements of the disjunction. In other words, unification distributes over disjunction.

// (a_0 | ... |a_n) & b ==> a_0&b | ... | a_n&b.
