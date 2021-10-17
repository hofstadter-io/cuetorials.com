package r

import "list"

#DepthF: {
  #next: _
	#func: {
    #in: _
		#basic: int|number|string|bytes|null
    out: {
			if (#in & #basic) != _|_ { 1 }
			if (#in & #basic) == _|_ {
				list.Max([for k,v in #in {(#next & {#in: v}).out}]) + 1
			}
    }
  }
}

#depth: (#RecurseN & {#depth: 11, #funcFactory: #DepthF}).Func

tree: {
	a: {
		foo: "bar"
		a: b: c: "d"
	}
	cow: "moo"
}

d: #depth & { #in: tree }
