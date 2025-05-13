include ~/.lcb-env

# ################
# HELP
help:
	@echo 'empty help (still)'

# ################
# Tuning
env:
	@nvim ~/.lcb-env
dev:
	@nvim Makefile


# ################
# Main target parts
rootfs.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)

uutils.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)

busybox.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)

kernel.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)


# ################
# Any submodule
%:
	@echo [ AUTODETECTION: $@ ]
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)


# ################
# GIT
pull:
	@git pull
savetogit: git.pushall
	@echo '<--'
git.pushall: git.commitall
	@git push
git.commitall: git.addall
	@if [ -n "$(shell git status -s)" ] ; then git commit -m 'saving'; else echo '--- nothing to commit'; fi
git.addall:
	@git add .

