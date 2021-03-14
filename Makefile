
PKGS=$(wildcard *.dhall)
EXAMPLES=$(wildcard examples/*.dhall)
FREEZE=$(PKGS:%.dhall=%.dhall.freezed)
FREEZE_EXAMPLES=$(EXAMPLES:%.dhall=%.dhall.freezed)
YAML_EXAMPLES=$(EXAMPLES:examples/%.dhall=examples/out/%.yaml)

all: freeze examples

examples/out/%.yaml: examples/%.dhall
	mkdir -p .cache
	sed 's#https://raw.*package.dhall.*#./package.dhall#' $< | \
	  env XDG_CACHE_HOME=.cache dhall-to-yaml --output $@

examples: $(YAML_EXAMPLES)

%.dhall.freezed: %.dhall
	dhall freeze --all --inplace $<

freeze: $(FREEZE) $(FREEZE_EXAMPLES)

clean: $(YAML_EXAMPLES)
	rm -Rf $^ .cache
