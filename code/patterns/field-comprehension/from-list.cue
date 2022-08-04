// The list of valid keys
#List: ["foo", "bar"]
// Turned into a definitino
#Map: { for _, l in #List { (l): _ } }

// Used as a constraint
m: #Map & { 
  foo: "f"
  // invalid: _
}
