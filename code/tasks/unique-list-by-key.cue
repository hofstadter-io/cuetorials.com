#elem: {
  key: string
  val: _
}

elems: [...#elem] & [
  { key: "a", val: 1 },
  { key: "b", val: 1 },
  // { key: "a", val: 2 }, // uncomment this line to see error
  { key: "b", val: 1 },
]

set: [string]: #elem
set: {
  for e in elems {
    "\(e.key)": e
  }
}

uniq: [ for s in set { s } ]
