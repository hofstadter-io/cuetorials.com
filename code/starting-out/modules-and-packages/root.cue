package root

import (
	// imports from a dependency
	"github.com/foo/bar"
	// import from a dependency subdir, rerwite name
	B "github.com/foo/bar/b"
	// import from a nested dir with package name
	"github.com/foo/bar/multi:hello"
	"github.com/foo/bar/multi:world"

	// import from this module
	"github.com/hofstadter-io/cuetorials/a"
)

root: "root"

vals: {
	ex1: bar.value
	ex2: B.b
	ex3: hello.msg
	ex4: world.msg
	ex5: a.a
}
