
SRC=$(wildcard examples/*.dhall)
EXAMPLES=$(SRC:examples/%.dhall=examples/out/%.yaml)

all: examples gh-worflow-update

examples/out/%.yaml: examples/%.dhall
	mkdir -p .cache
	sed 's#https://raw.*package.dhall #./package.dhall #' $< | \
	  env XDG_CACHE_HOME=.cache dhall-to-yaml --output $@

examples: $(EXAMPLES)

gh-worflow-update:
	cp examples/out/hello-world.yaml .github/workflows/hello-world.yaml


clean: $(EXAMPLES)
	rm -Rf $^ .cache
