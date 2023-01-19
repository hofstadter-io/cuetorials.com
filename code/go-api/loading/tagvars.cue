os: string @tag(os,var=os)

// use the current OS
// cue eval tagvars.cue -T
// os: "linux"

// set a specific OS
// cue eval tagvars.cue -t os=darwin
// os: "darwin"
