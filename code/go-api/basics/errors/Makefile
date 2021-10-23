DIFF_CMD   = @git diff --exit-code

tests = errors

.PHONY: all
all: $(tests)

errors: errors.go
	@go run errors.go > errors.txt
	$(DIFF_CMD) errors.txt

