package main

import (
	"context"
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/tools/flow"
)

var CTX cue.Context

// Our tasks specified as Cue
var input = `
tasks: {
	a: {
		foo: 1
		hello: string
	}
	b: {
		foo: 2
	}
	c: {
		foo: a.foo * 3
		goo: b.foo * 3
	}
}
`

func main() {
	var err error
	fmt.Println("Custom Flow Task")

	// create context
	ctx := cuecontext.New()

	// Setup the flow Config
	cfg := &flow.Config{Root: cue.ParsePath("tasks")}

	// compile our input
	value := ctx.CompileString(input, cue.Filename("input.cue"))
	if value.Err() != nil {
		fmt.Println("Error:", value.Err())
		return
	}

	// create the workflow whiich will build the task graph
	workflow := flow.New(cfg, value, TaskFactory)

	// run our custom workflow
	err = workflow.Run(context.Background())
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
}

// This function implements the Runner interface.
// It parses Cue values, you will see all of them recursively
func TaskFactory(val cue.Value) (flow.Runner, error) {
	// You can see the recursive values with this
	fmt.Println("TF: ", val)

	// Check that we have something that looks like a task
	foo := val.Lookup("foo")
	if !foo.Exists() {
		return nil, nil
	}

	num, err := foo.Int64()
	if err != nil {
		return nil, err
	}

	// Create and return a flow.Runner
	ct := &CustomTask{
		Val: int(num),
	}
	return ct, nil
}

// Our custom task with some extra data
// While we only have one task here, you can have as many as you like
// It's up to the TaskFunc (TaskFactory above) to create the tasks
type CustomTask struct {
	Val int
}

// Tasks must implement a Run func, this is where we execute our task
func (C *CustomTask) Run(t *flow.Task, pErr error) error {
	// not sure this is OK, but the value which was used for this task
	val := t.Value()
	fmt.Println("CustomTask:", C.Val, val)

	// Do some work
	next := map[string]interface{}{
		"bar": C.Val + 1,
	}
	hello := val.Lookup("hello")
	if hello.Exists() {
		next["hello"] = "world"
	}

	// Use fill to "return" a result to the workflow engine
	t.Fill(next)

	return nil
}
