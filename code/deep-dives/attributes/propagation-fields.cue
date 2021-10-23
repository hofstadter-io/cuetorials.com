	// Attributes are collected
x: _ @foo(bar) @cow(moo)
x: _ @foo(baz)

// this can be problematic
n: int @protobuf(1,int64)
n: int @protobuf(2,int64)

// field attributes don't propegate
y: x
