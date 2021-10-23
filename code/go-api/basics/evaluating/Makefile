DIFF_CMD   = @git diff --exit-code

tests = eval

.PHONY: all
all: $(tests)

eval: eval.go
	@go run eval.go > eval.txt
	$(DIFF_CMD) eval.txt

