DIFF_CMD   = @git diff --exit-code

tests = eval subsume unify validate

.PHONY: all
all: $(tests)

eval: eval.go
	@go run eval.go > eval.txt
	$(DIFF_CMD) eval.txt

subsume: subsume.go
	@go run subsume.go > subsume.txt
	$(DIFF_CMD) subsume.txt

unify: unify.go
	@go run unify.go > unify.txt
	$(DIFF_CMD) unify.txt

validate: validate.go
	@go run validate.go > validate.txt
	$(DIFF_CMD) validate.txt

