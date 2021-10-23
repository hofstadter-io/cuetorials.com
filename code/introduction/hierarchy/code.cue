package hierarchy

import "list"

#Schema: {
	hello: string
	life:  int
	pi:    float
	nums: [...int]
	struct: {...}
}

#Constrained: #Schema & {
	hello: =~"[a-z]+"
	life:  >0
	nums:  list.MaxItems(10)
}

Value: #Constrained & {
	hello: "world"
	life:  42
	pi:    3.14
	nums: [1, 2, 3, 4, 5]
	struct: {
		a: "a"
		b: "b"
	}
}
