// use if guard to get even numbers in a list comprehension
nums: [1, 2, 3, 4, 5, 6, 7, 8]
sqrs: [ for n in nums if mod(n, 2) == 0 {n * n}]

// use if guard to conditionally add fields
elems: [
	{name: "a", public: true},
	{name: "b", public: true},
	{name: "c", public: false},
	{name: "d"},
]

Elems: {
	hasPublicField: {
		for key, val in elems {
			// test against _|_ to see if a field exists
			if val.public != _|_ {
				"\(key)": val
			}
		}
	}
	stringifyPublic: {
		for key, val in elems {

			// there is no short-circuit, so we must nest guard instead
			if val.public != _|_ {

				// test conjunctions not equal to bottom for "truthiness"
				if (val.public & true) != _|_ {
					"\(key)": val & {PUB: "true"}
				}

				// note, there is no "else" clause
				if (val.public & false) != _|_ {
					"\(key)": val & {PUB: "false"}
				}
			}
		}
	}
}
