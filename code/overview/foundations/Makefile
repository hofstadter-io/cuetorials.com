DIFF_CMD   = @git diff --exit-code

tests = superset \
				fields \
				definition \
				conjunction \
				disjunction \
				default-optional \
				building-up \
				order

.PHONY: all $(tests)
all: $(tests)

superset:
	cue export superset.cue -f -o superset.json
	$(DIFF_CMD) superset.json

fields:
	cue eval fields.cue -f -o fields-eval.cue
	$(DIFF_CMD) fields-eval.cue

definition:
	cue export definition.cue -f -o definition.json
	$(DIFF_CMD) definition.json

conjunction:
	cue export conjunction.cue -f -o conjunction.json
	$(DIFF_CMD) conjunction.json

disjunction:
	cue export disjunction.cue -f -o disjunction.json
	$(DIFF_CMD) disjunction.json

default-optional:
	cue export default-optional.cue -f -o default-optional.json
	$(DIFF_CMD) default-optional.json

building-up:
	cue export building-up.cue -f -o building-up.json
	$(DIFF_CMD) building-up.json

order:
	cue export order.cue order-2.cue -f -o order-out.json
	$(DIFF_CMD) order-out.json
