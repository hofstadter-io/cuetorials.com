// an open list
L1: [...]

// one element list with any type
L2: [_]

// an int list with at least one element
L3: [int, ...]

// a mixed list of four elements
L4: [int, string, {...}, _]

// you can concatenate lists too
L5: L2 + L3 // open
L6: L2 + L4 // closed
L7: L3 + L2 // closed, L3 ellipses removed

// You cannot append or reopen like this
L2: L2 + [...]
