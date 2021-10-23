package algos

import "list"

objs: {
	obj1: {
		val: 1
	}

	obj1b: {
		val: 1
	}

	obj2a: {
		val: "a"
		deps: ["obj1"]
	}

	obj2b: {
		val: "b"
		deps: ["obj1"]
	}

	obj3: {
		val: 3
		deps: ["obj1", "obj2b", "obj2a"]
	}
}

ordered: (#toposort & {_In: objs}).out

_#obj: {
	name: string
	val:  _
	deps: [...string]
	edges: [N=string]: {name: N}
}

_#revd: {
	In: [string]:  _#obj
	Out: [string]: _#obj
	Out: {
		for o, O in In {
			"\(o)": {
				name: O.name
				val:  O.val
				deps: O.deps
			}
			for e, E in O.deps {
				"\(E)": {
					edges: "\(O.name)": {}
				}
			}
		}
	}
}

#toposort: {
	_In: [Name=string]: _#obj & {name: Name}
	_in:    (_#revd & {In: _In}).Out
	_range: list.Range(0, len(_in), 1)

	revd: _in

	#calc: {
		// initial state
		"0": {
			stack: [ for _, O in _in if len(O.edges) == 0 {O}]
			degrees: {
				for _, O in _in {
					let L = len(O.edges)
					if L != 0 {
						"\(O.name)": L
					}
					if L == 0 {
						"\(O.name)": -1
					}
				}
			}
			order: []
		}
		for i, _ in _range {
			let I = i + 1
			let last = #calc["\(i)"]

			let vert = last.stack[0]

			"\(I)": {
				order: last.order + [vert.name]
				_degrees: {
					for d, D in last.degrees {
						if d == vert.name {
							"\(d)": -1
						}
						if d != vert.name {
							let found = list.Contains(vert.deps, d)
							if found {

								"\(d)": D - 1
							}
							if !found {
								"\(d)": D
							}
						}
					}
				}
				stack: list.Drop(last.stack, 1) + [ for dep, deg in _degrees if deg == 0 {_in[dep]}]
				degrees: {
					for dep, deg in _degrees {
						if deg == 0 {
							"\(dep)": -1
						}
						if deg != 0 {
							"\(dep)": deg
						}
					}
				}
			}
		}

	}

	out: #calc["\(len(_in))"].order
}
