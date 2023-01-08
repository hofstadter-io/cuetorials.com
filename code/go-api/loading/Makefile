DIFF_CMD   = @git diff --exit-code

tests = simple

.PHONY: all
all: $(tests)

simple: simple.go
	go run simple.go > simple.txt
	$(DIFF_CMD) simple.txt



