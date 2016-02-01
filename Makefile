DIRS ?= $(shell git ls-tree --name-only -d HEAD)

define print-help
	$(if $(need-help),$(warning $1 -- $2))
endef

need-help := $(filter help,$(MAKECMDGOALS))

help: ; @echo $(if $(need-help),,Type \'make help\' to get help)
update: clean re-install

install: $(call print-help,install,creates symlinks to setup dot-files)
	@stow ${DIRS}

re-install: $(call print-help,re-install,re-creates symlinks to setup dot-files)
	@stow -R ${DIRS}

uninstall: $(call print-help,uninstall,unlinks dot-files)
	@stow -D ${DIRS}

clean: $(call print-help,clean,removes build artifacts)
	@rm -f get-pip.py

.PHONY: cleanup install update uninstall install uninstall re-install
