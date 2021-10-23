DIFF_CMD   = @git diff --exit-code

tests = builtins \
				bytes \
				errors \
				rawstrings

.PHONY: all $(tests)
all: $(tests)

builtins:
	cue eval builtins.cue > builtins.txt
	$(DIFF_CMD) builtins.txt

bytes:
	cue eval bytes.cue -f -o bytes-eval.cue
	$(DIFF_CMD) bytes-eval.cue
	cue export bytes.cue -f -o bytes-export.json
	$(DIFF_CMD) bytes-export.json

errors:
	-cue eval -c errors.cue 2> errors-out.txt
	$(DIFF_CMD) errors-out.txt

rawstrings:
	cue export rawstrings.cue -f -o rawstrings.json
	$(DIFF_CMD) rawstrings.json
