package fix

// Phil's code
#Fix: {
	F: _
	Out: *null | F & {Self: Out, ...}
}

#fix: {
	#F: _
	#I: _
	#O: *null | (#fix & {
		"#F": #F
		"#I": (#F & { in: #I }).out
	}).out
}

#f: {
	in: int
	out: in - 1
}

f: #f & { in: 4 }

F: #fix & { #F: #f, #I: 4 }

// f: #fix & { F: #f, I: 4 }



//list: {
	//val: _
	//next: *null | list
//}

//ll1: list & { val: "a", next: list & { val: 1 } }
