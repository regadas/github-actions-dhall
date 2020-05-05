
SRC=$(wildcard examples/*.dhall)
EXAMPLES=$(SRC:examples/%.dhall=examples/out/%.yaml)

all: examples gh-worflow-update

examples/out/%.yaml: examples/%.dhall
	dhall-to-yaml --file $< > $@

examples: $(EXAMPLES)

gh-worflow-update:
	cp examples/out/hello-world.yaml .github/workflows/hello-world.yaml


clean: $(EXAMPLES)
	rm $^
