DIFF_CMD   = @git diff --exit-code

tests = context encoding scope

.PHONY: all
all: $(tests)

context: context.go
	@go run context.go > context.cue
	$(DIFF_CMD) context.cue

encoding: encoding.go
	@go run encoding.go > encoding.cue
	$(DIFF_CMD) encoding.cue

scope: scope.go
	@go run scope.go > scope.cue
	$(DIFF_CMD) scope.cue

