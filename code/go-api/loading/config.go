type Config struct {

	// Context specifies the context for the load operation.
	// If the context is cancelled, the loader may stop early
	// and return an ErrCancelled error.
	// If Context is nil, the load cannot be cancelled.
	Context *build.Context

	// A Module is a collection of packages and instances that are within the
	// directory hierarchy rooted at the module root. The module root can be
	// marked with a cue.mod file.
	ModuleRoot string

	// Module specifies the module prefix. If not empty, this value must match
	// the module field of an existing cue.mod file.
	Module string

	// Package defines the name of the package to be loaded. If this is not set,
	// the package must be uniquely defined from its context. Special values:
	//    _    load files without a package
	//    *    load all packages. Files without packages are loaded
	//         in the _ package.
	Package string

	// Dir is the directory in which to run the build system's query tool
	// that provides information about the packages.
	// If Dir is empty, the tool is run in the current directory.
	Dir string

	// Tags defines boolean tags or key-value pairs to select files to build
	// or be injected as values in fields.
	//
	// Each string is of the form
	//
	//     key [ "=" value ]
	//
	// where key is a valid CUE identifier and value valid CUE scalar.
	Tags []string

	// TagVars defines a set of key value pair the values of which may be
	// referenced by tags.
	//
	// Use DefaultTagVars to get a pre-loaded map with supported values.
	TagVars map[string]TagVar

	// If DataFiles is set, the loader includes entries for directories that
	// have no CUE files, but have recognized data files that could be converted
	// to CUE.
	DataFiles bool

	// Overlay provides a mapping of absolute file paths to file contents.  If
	// the file with the given path already exists, the parser will use the
	// alternative file contents provided by the map.
	Overlay map[string]Source

	// Stdin defines an alternative for os.Stdin for the file "-". When used,
	// the corresponding build.File will be associated with the full buffer.
	Stdin io.Reader
	// contains filtered or unexported fields
}
