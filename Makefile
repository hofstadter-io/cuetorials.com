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

.PHONY: htmlfiles cleanhtml
htmlfiles: $(HTML_FILES)
	@for f in $(HTML_FILES); do echo $$f; done
cleanhtml:
	@for f in $(HTML_FILES); do rm $$f; done

code/%.html: code/%.cue
	@echo highlight "$<" as "$@"
	@NODE_PATH=/usr/lib/node_modules node ci/highlight.js < "$<" > "$@"

.PHONY: hugo
hugo:
	@hugo --baseURL https://cuetorials.com/ -d dist

.PHONY: docker
docker: image push

.PHONY: image
image:
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


.PHONY: verify_code verify_code verify_diff
verify: verify_code highlight verify_diff

verify_diff:
	@git diff --exit-code code/

verify_code:
	make -C code all

format_code:
	cd code && cue fmt ./...
	cd code && gofmt -w ./..
