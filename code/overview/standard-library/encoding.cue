package stdlib

import (
	"encoding/json"
)

data: """
	{
		"hello": "world",
		"list": [ 1, 2 ],
		"nested": {
			"foo": "bar"
		}
	}
	"""

jval: json.Unmarshal(data)

val: {
	hello: "world"
	list: [1, 2]
	nested: foo: "bar"
}

cjson: json.Marshal(val)
