DIFF_CMD   = @git diff --exit-code

tests = superset

.PHONY: all $(tests)
all: $(tests)

superset:
	cue export superset.cue -f -o superset.json
	$(DIFF_CMD) superset.json

