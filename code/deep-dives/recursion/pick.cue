package r

#pickF: {
	#next: _
	#func: {
		#X: _
		#P: _
		pick: {
			// if P is not a complex type
			if (#P & ({...} | [...])) == _|_ {
				// then take the leaf value if it unifies (note to dev, should there be an if here?)
				#P & #X
			}

			// if P is a complex type
			if (#P & ({...} | [...])) != _|_ {
				// for each field in P
				for i, p in #P {
					let x = #X[i]

					// if they unify (samish type)
					if (x & p) != _|_ {
						// if not a struct, pick the value
						if (x & {...}) == _|_ {
							"\(i)": x
						}

						// if it is a struct, then "recurse"
						if (x & {...}) != _|_ {
							"\(i)": (#next & {#X: x, #P: p}).pick
						}
					}

					// if they do not unify
					if (x & p) == _|_ {
						// and if struct, then recurse
						if (x & {...}) != _|_ {
							"\(i)": (#next & {#X: x, #P: p}).pick
						}
					}

				}

			}
		}
	}
}

#Pick: #RecurseN & {#funcFactory: #pickF}

tree: {
	a: {
		foo: "bar"
		a: b: c: "d"
	}
	cow: "moo"
}

P: {
	a: foo: string
	cow: "moo"
}

p: #pick & {#X: tree, #P: P}
