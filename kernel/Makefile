include ~/.lcb-env

# ################
# Kernel
menu:
	@cd $(LINUX_KERNEL_SOURCE) && $(MAKE) menuconfig

all: clean build import

clean:
	@mkdir -p $(KERNEL_AND_MODULES)
	@rm -rf $(KERNEL_AND_MODULES)/*
build:
	@cd $(LINUX_KERNEL_SOURCE) && $(MAKE) all -j14
import:
	@cp -f $(LINUX_KERNEL_SOURCE)/arch/x86/boot/bzImage $(KERNEL_AND_MODULES)/vmlinuz
	@cd $(LINUX_KERNEL_SOURCE) && $(MAKE) modules_install INSTALL_MOD_PATH="$(KERNEL_AND_MODULES)"
	@rm -vf $(KERNEL_AND_MODULES)/lib/modules/6.12.27/build

