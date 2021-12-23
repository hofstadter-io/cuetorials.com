DIFF_CMD   = @git diff --exit-code

tests = oneOf

.PHONY: all $(tests)
all: $(tests)

#oneOf:
	#cue export oneOf.cue -f -o oneOf-out.cue ; test $$? -eq 1
	#$(DIFF_CMD) oneOf-out.cue

anyOf:
	cue export anyOf.cue -f -o anyOf-out.cue
	$(DIFF_CMD) anyOf-out.cue

