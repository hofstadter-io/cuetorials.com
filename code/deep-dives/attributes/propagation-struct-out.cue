#X: {
    @model(db)
    uuid: string @key(primary)
} @app(backend)
x: {
    @model(db)

    @model(ui) // can build up
    uuid: string @key(primary) @key(secondary)
}
