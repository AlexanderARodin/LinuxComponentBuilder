include ~/.lcb-env

# ################
# Populate RootFS
menu:
	@echo 'there is no Menu'
	@exit 1

allin: clean modules corebox init-minimal
	@echo '<--'

clean:
	@mkdir -p $(ROOT_FS)
	@rm -rf   $(ROOT_FS)/*
	@rm -rf   $(ROOT_FS)/.??*
	@mkdir -p $(ROOT_FS)/proc

modules:
	@cp -vrf $(KERNEL_AND_MODULES)/lib $(ROOT_FS)/

corebox:
	@mkdir -p $(ROOT_FS)/bin
	@cp -v $(TARGET_DIR)/busybox      $(ROOT_FS)/bin/
	@cp -v $(TARGET_DIR)/busybox.suid $(ROOT_FS)/bin/	|| true
	@cp -v $(TARGET_DIR)/coreutils    $(ROOT_FS)/bin/
	@scripts/install-shortcuts.sh     $(ROOT_FS)/bin/

init-minimal:
	@cp -v assets/init-minimal        $(ROOT_FS)/init
	@chmod +x $(ROOT_FS)/init
