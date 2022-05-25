package utils

import "strings"

// A reusable task to return the root path of a git repository
RepoRoot: {
	// this is the special, task identifying field
	$id: "tool/exec.Run"
	cmd: ["bash", "-c", "git rev-parse --show-toplevel"]
	stdout: string
	Out:    strings.TrimSpace(stdout)
}
