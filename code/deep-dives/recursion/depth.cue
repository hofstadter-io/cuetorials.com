package r

import "list"

#DepthF: {
	#next: _
	#func: {
		#in:    _
		#basic: int | number | string | bytes | null
		out: {
			// if we have a basic type, we are at a leaf, depth is 1
			if (#in & #basic) != _|_ {1}

			// if we are not a basic type, then we are 1 + the max of children
			if (#in & #basic) == _|_ {
				// this is our "recursion" for each child
				let depths = [ for k, v in #in {(#next & {#in: v}).out}]
				list.Max(depths) + 1
			}
		}
	}
}

#Depth: #RecurseN & {#maxiter: 11, #funcFactory: #DepthF}

tree: {
	a: {
		foo: "bar"
		a: b: c: "d"
	}
	cow: "moo"
}

d: #Depth & {#in: tree}
