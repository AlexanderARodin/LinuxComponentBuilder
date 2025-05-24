include ~/.lcb-env

ATARGET=target
AROOT=target/root_fs

# ################
# Populate RootBIN
menu:
	@echo 'there is no Menu'
	@exit 1
	
dev:
	@nvim scripts/list_comparator.sh

allin: clean corebox
	@echo '<--'

clean:
	@rm -rf   $(ATARGET)/*
	@mkdir -p $(AROOT)

corebox:
	@mkdir -p $(AROOT)/bin
	@cp -v $(TARGET_DIR)/busybox      $(AROOT)/bin/
	@cp -v $(TARGET_DIR)/busybox.suid $(AROOT)/bin/	|| true
	@cp -v $(TARGET_DIR)/coreutils    $(AROOT)/bin/
	########@scripts/install-shortcuts.sh     $(AROOT)/bin/

check.busybox:
	@scripts/list_comparator.sh busybox
	#@$(AROOT)/bin/busybox --list | diff assets/busybox.chck_lst - | grep '^[>,<]'
