import (
	"encoding/yaml"
	"text/template"
)

foo: {
	s: string
	i: int
	f: float
	b: bool
}

#prep: {
	In: {...}
	Out: {
		for l, v in In {
			"\(l)": [
				if (v & "") != _|_ {"string"},
				if (v & 1.0) != _|_ {"float64"},
				if (v & 1) != _|_ {"int"},
				if (v & true) != _|_ {"bool"},
				"unknown type",
			][0]
		}
	}
}

val: {
	Foo: (#prep & {In: foo}).Out
}

data: yaml.Marshal(val)

tmpl: #"""
	{{ range $Type, $Fields := . }}
	type {{ $Type }} struct {
		{{ range $k, $v := $Fields }}
		{{ $k }} {{ $v }} `json:"{{$k}}"`
		{{ end }}
	}
	{{ end }}
	"""#

go: template.Execute(tmpl, val)
