-include ~/.lcb-env
KERNEL_AND_MODULES=$(TARGET_DIR)/kernel_and_modules

# ################
# HELP
help:
	@echo 'empty help (still)'

env:
	@nvim ~/.lcb-env
dev:
	@nvim Makefile

test:
	@echo "test -> $(LINUX_KERNEL_SOURCE)"
	@echo "test -> $(INSTALL_MOD_PATH)"

# ################
# BusyBox
bb.menu:
	@cd $(BUSYBOX_SOURCE) && make menuconfig

bb.pull:
	@cp -v $(BUSYBOX_SOURCE)/.config assets/busybox.config
bb.push:
	@cp -v assets/busybox.config $(BUSYBOX_SOURCE)/.config
bb.build:
	@cd $(BUSYBOX_SOURCE) && make busybox -j14
bb.import:
	@cp -f $(BUSYBOX_SOURCE)/busybox $(TARGET_DIR)/busybox

bb.su_pull:
	@cp -v $(BUSYBOX_SOURCE)/.config assets/busybox_suid.config
bb.su_push:
	@cp -v assets/busybox_suid.config $(BUSYBOX_SOURCE)/.config
bb.su_build:
	@cd $(BUSYBOX_SOURCE) && make busybox -j14
bb.su_import:
	@cp -f $(BUSYBOX_SOURCE)/busybox $(TARGET_DIR)/busybox.suid

bb.allin: bb.push bb.build bb.import bb.su_push bb.su_build bb.su_import


# ################
# Kernel
kernel.menu:
	@cd $(LINUX_KERNEL_SOURCE) && make menuconfig
kernel.rebuild:
	@mkdir -p $(KERNEL_AND_MODULES)
	@rm -rf $(KERNEL_AND_MODULES)/*
	@cd $(LINUX_KERNEL_SOURCE) && make all -j14
	@cp -f $(LINUX_KERNEL_SOURCE)/arch/x86/boot/bzImage $(KERNEL_AND_MODULES)/vmlinuz
	@cd $(LINUX_KERNEL_SOURCE) && make modules_install INSTALL_MOD_PATH="$(KERNEL_AND_MODULES)"
	@rm -vf $(KERNEL_AND_MODULES)/lib/modules/6.12.27/build

# ################
# GIT
pull:
	@git pull
savetogit: git.pushall
git.pushall: git.commitall
	@git push
git.commitall: git.addall
	@if [ -n "$(shell git status -s)" ] ; then git commit -m 'saving'; else echo '--- nothing to commit'; fi
git.addall:
	@git add .
