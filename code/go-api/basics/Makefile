tests = context \
				errors \
				printing \
				evaluating

verifies = $(addprefix verify_, $(tests))

.PHONY: all
all: $(verifies)

$(verifies): verify_%:
	@make -C $(subst verify_,,$@)
