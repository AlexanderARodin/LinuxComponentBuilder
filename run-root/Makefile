include ~/.lcb-env

# ################
# RUN Root
menu:
	@echo 'there is no Menu'
	@exit 1

user.shell: #chroot-init
	@scripts/run-container.sh --unshare-user \
		$(ROOT_FS) \
		/bin/sh
		#'/init'

# #######################################
# TODO
#chroot.hardcore:
#	@scripts/run-container.sh --chroot \
#		'target/current-root' '/bin/sh'
#unshare.root: chroot-init
#	@scripts/run-container.sh --unshare-root \
#		'target/current-root' '/init'
#unshare.user: chroot-init
#	@scripts/run-container.sh --unshare-user \
#		'target/current-root' '/init'
#
