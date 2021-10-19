#A: {
   x: int @protobuf(1,int64)
   y: int @protobuf(2,int64)
}

a: #A
a: {
  x: 1
  y: x  // propagation here
}
