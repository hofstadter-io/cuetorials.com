#X: {
	@model(db)
	uuid: string @key(primary)
} @app(backend)                // does not propagate

x: #X & {
	@model(ui)                   // can build up
	uuid: string @key(secondary) // can conflict
}

y: {
	#X
	uuid: "abc-123"
}
