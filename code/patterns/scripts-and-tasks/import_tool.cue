package scripts

import (
	"encoding/json"
	"hof.io/example/load"
)

vars: {
	// @tag() is used with the -t flag to inject dynamic values
	user: string | *"dr_verm" @tag(user)
}

meta: {
	secrets: {
		// we can import and add a task to our tasks and scripts
		tLoad: load.load
		token: tLoad.say
	}

	req: {
		url:    "https://postman-echo.com/get?cow=\(secrets.token)"
		method: "GET"
	}
}

command: authd: {
	// localized dependency
	cfg: meta

	get: {
		// we can reuse values and infer dependencies
		req: cfg.req & {
			$id: "tool/http.Do"
		}
		resp: req.response
		// we can process task outputs, and still infer depenencies
		Out: json.Indent(resp.body, "", " ")
	}
	print: {
		$id: "tool/cli.Print"
		// still makes a dependency (get.Out)
		text: "\(get.Out) @\(vars.user)"
	}
}
