package gen

import "text/template"

data: {
	// meta info
	name: *"tasks" | string @tag(name)
	msg:  "Hello \(name), welcome to Cuetorials"

	// task list
	tasks: [
		{name: "t1", effort: 1, complete: true},
		{name: "t2", effort: 4, complete: true},
		{name: "t3", effort: 3, complete: false},
		{name: "t4", effort: 2, complete: true},
		{name: "t5", effort: 3, complete: false},
	]

	// grouped tasks
	complete: [ for t in tasks if t.complete == true {t}]
	incomplete: [ for t in tasks if t.complete == false {t}]
}

// Templates which use Go's template engine
templates: [
	{
		filename: "\(data.name)-todo.txt"
		contents: """
			{{ .msg }}

			--- TODO ---
			{{ range $T := .incomplete -}}
			{{ printf "%-4s%v" $T.name $T.effort }}
			{{ end }}
			"""
	}, {
		filename: "\(data.name)-done.txt"
		contents: """
		Here's what you have finished \(data.name). Good job!

		--- DONE ---
		{{ range $T := .complete -}}
		{{ $T.name }}
		{{ end }}
		"""
	},
]

// The rendered output from data+templates
rendered: [ for T in templates {
	filename: T.filename
	contents: template.Execute(T.contents, data)
}]
