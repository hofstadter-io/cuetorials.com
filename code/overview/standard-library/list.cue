package stdlib

import "list"

l1: [1, 2, 3, 4, 5]
l2: ["c", "b", "a"]

// constrain length
l2: list.MinItems(1)
l2: list.MaxItems(3)

// slice a list
l3: list.Slice(l1, 2, 4)

// get the sum and product
sum: list.Sum(l1)
prd: list.Product(l1)

// linear search for list (no binary)
lc: list.Contains(l1, 2)

// sort a list
ls:  list.Sort(l2, list.Ascending)
l2s: list.IsSorted(l2, list.Ascending)
lss: list.IsSorted(ls, list.Ascending)

// Flatten a list
ll: [1, [2, 3], [4, [5]]]
lf: list.FlattenN(ll, 1)
