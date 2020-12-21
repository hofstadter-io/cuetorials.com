A: {
	_hidden: "a hidden field"
	isshown: "I can be seen"
	hidrefd: _hidden + " sort of?"
}

_#NoshowDefn: {
	hello: string
	num: int | *42
}

B: _#NoshowDefn & { hello: "world" }

_see: "me"
