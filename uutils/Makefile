include ~/.lcb-env

# ################
# UUtils CoreUtils
menu:
	@echo 'there is no Menu'
	@exit 1

clean:
	@rm -f $(TARGET_DIR)/coreutils
import:
	@cp -f $(UUTILS_BIN)/coreutils $(TARGET_DIR)/coreutils

all: clean import
	@echo '<--'
