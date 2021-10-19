#A: {
    x: int @protobuf(1,int64)
    y: int @protobuf(2,int64)
}
a: {
    x: 1 @protobuf(1,int64)
    y: 1 @protobuf(2,int64)
}

// would result in a conflict for indexes
a: y: 1 @protobuf(1,int64) @protobuf(2,int64)
