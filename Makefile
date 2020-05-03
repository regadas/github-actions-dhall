
SRC=$(wildcard examples/*.dhall)
EXAMPLES=$(SRC:examples/%.dhall=examples/%.yaml)

all: examples gh-worflow-update

examples/%.yaml: examples/%.dhall
	dhall-to-yaml --file $< > $@

examples: $(EXAMPLES)

gh-worflow-update:
	cp examples/hello-world.yaml .github/workflows/hello-world.yaml


clean: $(EXAMPLES)
	rm $^
