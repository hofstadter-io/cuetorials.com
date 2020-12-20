package main

import (
	"context"
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/tools/flow"
)

var RT cue.Runtime

var input = `
tasks: {
	a: {
		foo: 1
		hello: string
	}
	b: {
		foo: 2
	}
}
`

func main() {
	var err error
	fmt.Println("Custom Flow Task")
	cfg := &flow.Config{ Root: cue.ParsePath("tasks") }

	inst, err := RT.Compile("input.cue", input)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	// nil config
	workflow := flow.New(cfg, inst, TaskFactory)

	err = workflow.Run(context.Background())
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
}

func TaskFactory(val cue.Value) (flow.Runner, error) {
	fmt.Println("TF: ", val)
	foo := val.Lookup("foo")
	if !foo.Exists() {
		return nil, nil
	}

	num, err := foo.Int64()
	if err != nil {
		return nil, err
	}
	ct := &CustomTask{
		Val: int(num),
	}
	return ct, nil
}

type CustomTask struct {
	Val int
}

func (C *CustomTask) Run(t *flow.Task, pErr error) error {
	// not sure this is OK
	val := t.Value()
	fmt.Println("CustomTask:", C.Val, val)

	next := map[string]interface{}{
		"bar": C.Val + 1,
	}

	hello := val.Lookup("hello")
	if hello.Exists() {
		next["hello"] = "world"
	}

	t.Fill(next)

	return nil
}
