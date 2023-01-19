CUE_FILES  = $(shell find code/ -type f -name '*.cue' ! -path './code/vendor/*' )
HTML_FILES = $(patsubst code/%.cue, code/%.html, $(CUE_FILES))
TAG        = $(shell git rev-parse --short HEAD | tr -d "\n")
PROJECT    = "hof-io--develop"

help:
	@cat Makefile

.PHONY: all
all: config.yaml highlight hugo docker deploy

.PHONY: dev
dev: config.yaml
	@hugo serve --bind 0.0.0.0 --buildDrafts --buildFuture --disableFastRender

# run locally in prd mode
.PHONY: prd
prd: config.yaml
	@hugo serve --bind 0.0.0.0

# https://github.com/stevenvachon/broken-link-checker
BLC_EXCLUDES=--exclude 'https://github.com/hofstadter-io/cuetorials.com/issues/new' \
	--exclude 'https://github.com/hofstadter-io/cuetorials.com/edit'
blc: blc.dev
blc.dev:
	blc -ro http://localhost:1313 ${BLC_EXCLUDES}
blc.prd:
	blc -ro https://docs.hofstadter.io ${BLC_EXCLUDEDS}

config.yaml: config.cue
	cue export config.cue --out yaml --outfile config.yaml --force

.PHONY: highlight code
highlight: $(HTML_FILES)
code: highlight

.PHONY: codefiles
codefiles: $(CUE_FILES)
	@for f in $(CUE_FILES); do echo $$f; done

.PHONY: htmlfiles cleanhtml
htmlfiles: $(HTML_FILES)
	@for f in $(HTML_FILES); do echo $$f; done
cleanhtml:
	@for f in $(HTML_FILES); do rm $$f; done

code/%.html: code/%.cue
	@echo highlight "$<" as "$@"
	@node ci/highlight.js < "$<" > "$@"

.PHONY: hugo
hugo: config.yaml
	@rm -rf dist
	@hugo --baseURL https://cuetorials.com/ -d dist

.PHONY: docker
docker: image push

.PHONY: image
image: hugo
	@docker build --no-cache -f ci/Dockerfile -t us.gcr.io/$(PROJECT)/cuetorials.com:$(TAG) .

.PHONY: nginx
nginx:
	@docker run --rm -it -p 8080:80 --name cuetorials us.gcr.io/$(PROJECT)/cuetorials.com:$(TAG)

.PHONY: push
push:
	@docker push us.gcr.io/$(PROJECT)/cuetorials.com:$(TAG)

.PHONY: deploy
deploy:
	@cue export ci/cuelm.cue -t version=$(TAG) -e Install | kubectl apply -f -

.PHONY: deploy-view
deploy-view:
	@cue export ci/cuelm.cue -t version=$(TAG) -e Install

.PHONY: verify_code verify_code verify_diff
verify: verify_code highlight verify_diff

verify_diff:
	@git diff --exit-code code/

verify_code:
	make -C code all

fmt: cuefmt gofmt

.PHONY: cuefmt cuefiles
cuefiles_mega:
	find code/ -type f -name '*.cue' '!' -path '*/cue.mod/*' -print
cuefiles_all:
	find code/ -type f -name '*.cue' '!' -path '*/cue.mod/*' -print
cuefiles:
	find code/ -type f -name '*.cue' '!' -path '*/cue.mod/*' '!' -path '*/templates/*' '!' -path '*/partials/*' '!' -path '*/.hof/*' -print
cuefmt:
	find code/ -type f -name '*.cue' '!' -path '*/cue.mod/*' '!' -path '*/templates/*' '!' -path '*/partials/*' '!' -path '*/.hof/*' -exec cue fmt {} \;

.PHONY: gofmt gofiles
gofiles_all:
	find code/ -type f -name '*.go' '!' -path '*/cue.mod/*' -print
gofiles:
	find code/ -type f -name '*.go' '!' -path '*/cue.mod/*' '!' -path '*/templates/*' '!' -path '*/partials/*' '!' -path '*/.hof/*' -print
gofmt:
	find code/ -type f -name '*.go' '!' -path '*/cue.mod/*' '!' -path '*/templates/*' '!' -path '*/partials/*' '!' -path '*/.hof/*' -exec gofmt -w {} \;

