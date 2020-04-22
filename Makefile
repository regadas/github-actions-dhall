
SRC=$(wildcard examples/*.dhall)
EXAMPLES=$(SRC:examples/%.dhall=.github/workflows/%.yaml)

.github/workflows/%.yaml: examples/%.dhall
	dhall-to-yaml --file $< > $@

examples: $(EXAMPLES)

update:

clean: 
	rm .github/workflows/*.yaml
