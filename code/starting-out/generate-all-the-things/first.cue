package gen

import "text/template"

gen: {
	data: {
		name: *"Tony" | string @tag(name)
		msg: "Hello \(name), welcome to Cuetorials"

		tasks: [
			{ name: "t1", effort: 1, complete: true },
			{ name: "t2", effort: 4,  complete: true },
			{ name: "t3", effort: 3,  complete: false },
			{ name: "t4", effort: 2,  complete: true },
			{ name: "t5", effort: 3,  complete: false },
		]

		C: [ for t in tasks if t.complete == true { t } ]
		I: [ for t in tasks if t.complete == false { t } ]
	}

	templates: [
		{
			filename: "\(data.name)-todo.txt"
			contents: """
			{{ .msg }}

			--- TODO ---
			{{ range $T := .I -}}
			{{ printf "%-4s%v" $T.name $T.effort }}
			{{ end }}
			"""
		},{
			filename: "\(data.name)-done.txt"
			contents: """
			Here's what you have finished \(data.name). Good job!

			--- DONE ---
			{{ range $T := .C -}}
			{{ $T.name }}
			{{ end }}
			"""
		}
	]

	rendered: [ for T in templates {
		filename: T.filename
		contents: template.Execute(T.contents, data)
	}]
}

