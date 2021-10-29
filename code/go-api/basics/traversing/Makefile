DIFF_CMD   = @git diff --exit-code

tests = print format

.PHONY: all
all: $(tests)

print: print.go
	go run print.go > print.cue
	$(DIFF_CMD) print.cue

format: format.go
	go run format.go > format.cue
	$(DIFF_CMD) format.cue



