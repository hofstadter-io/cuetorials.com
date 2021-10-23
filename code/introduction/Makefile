DIFF_CMD   = @git diff --exit-code

tests = hierarchy json-superset

.PHONY: all $(tests)
all: $(tests)

hierarchy:
	@cue export hierarchy/code.cue > /dev/null

json-superset:
	@cue export --out cue json-superset/lhs.json > json-superset/rhs.cue
	$(DIFF_CMD) json-superset/rhs.cue
