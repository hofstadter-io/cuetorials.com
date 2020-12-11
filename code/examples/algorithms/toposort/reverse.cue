package revdep

import "list"

#edge: {
	name: string
	seen: bool
	done: bool
}

#obj: {
	name: string
	val: int
	deps: [...string]
	edges: [E=string]: #edge & { name: E }
}


objs: [Name=string]: #obj & { name: Name }
objs: {
	obj1: {
		val: 1
	}

	obj2: {
		val: 2
		deps: ["obj1"]
	}

	obj3: {
		val: 3
		deps: ["obj1", "obj2"]
	}
}

revd: [Name=string]: #obj & { name: Name }
revd: {
	for o, O in objs {
		"\(o)": {
				name: O.name
				val: O.val
				deps: O.deps
		}
		for e, E in O.deps {
			"\(E)": {
				edges: "\(O.name)": {}
			}
		}
	}
}

#toposort: {
	_in: revd
	_range: list.Range(0,len(_in),1)

	#calc: {
		// initial state
		"0": {
			stack: [for _, O in _in if len(O.edges) == 0 { O }]
			degrees: { 
				for _, O in _in { "\(O.name)": len(O.edges) }
			}
			order: []
		}
		for i, _ in _range {
			let I = i+1
			let last = #calc["\(i)"]

			//if len(last.stack) == 0 {
				//order: last.order
			//}

			//if len(last.stack) > 0 {
				let vert = last.stack[0]

				"\(I)": {
					order: last.order + [vert.name]
					degrees: {
						for d, D in last.degrees {
							if d == vert.name {
								"\(d)": -1
							}
							if d != vert.name {
								let found = list.Contains(vert.deps,d)
								if found {
									"\(d)": D - 1
								}
								if !found {
									"\(d)": D
								}
							}
						}
					}
					stack: list.Drop(last.stack, 1) + [for dep, deg in degrees if deg == 0 { _in[dep] }]
				}
			// }
		}

	}

	out: #calc["\(len(_in))"].order
}
