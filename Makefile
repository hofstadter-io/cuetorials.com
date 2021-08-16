CUE_FILES  = $(shell find code/ -type f -name *.cue | grep -v 'code/vendor/' | sort)
HTML_FILES = $(patsubst code/%.cue, code/%.html, $(CUE_FILES))
TAG        = $(shell git rev-parse --short HEAD | tr -d "\n")
PROJECT    = "hof-io--develop"

.PHONY: dev
dev:
	@hugo serve --bind 0.0.0.0 --buildDrafts --buildFuture

.PHONY: all
all: highlight hugo docker deploy

.PHONY: highlight code
highlight: $(HTML_FILES)
code: highlight

.PHONY: codefiles
codefiles: $(CUE_FILES)
	@for f in $(CUE_FILES); do echo $$f; done

code/%.html: code/%.cue
	@echo highlight "$<" as "$@"
	@chroma --html-only --html-inline-styles --html-tab-width=4 -f html -s solarized-dark "$<" > "$@"

.PHONY: hugo
hugo:
	@hugo --baseURL https://cuetorials.com/ -d dist

.PHONY: docker
docker: image push

.PHONY: image
image:
	@docker build -f ci/Dockerfile -t us.gcr.io/$(PROJECT)/cuetorials.com:$(TAG) .

.PHONY: push
push:
	@docker push us.gcr.io/$(PROJECT)/cuetorials.com:$(TAG)

.PHONY: deploy
deploy:
	@cue export ci/cuelm.cue -t version=$(TAG) -e Install | kubectl apply -f -
