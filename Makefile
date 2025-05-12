include ~/.lcb-env

# ################
# HELP
help:
	@echo 'empty help (still)'

# ################
# UUtils CoreUtils
uutils.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)

# ################
# BusyBox
busybox.menu:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)
busybox.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)

# ################
# Kernel
kernel.menu:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)
kernel.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)





# ################
# Tuning
env:
	@nvim ~/.lcb-env
dev:
	@nvim Makefile

# ######et -e
#   3
#     2 [ -z $1 ] && exit 1
#       1 echo $1#########
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



# ################
# Any submodule
%:
	@echo [ AUTODETECTION: $@ ]
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)
