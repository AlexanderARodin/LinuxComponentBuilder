#!/bin/bash
set -e

cd $1		# enter target directory

# # # # # # # # # # # # # #
# INSTALL shortcuts
install_applets() {
	if [ -f $1 ]; then
		echo " [ INSTALL $1 ] "
		APPLETS_LIST=$(./$1 --list)
		for l in $APPLETS_LIST
		do
			ln -vsr ./$1 $l
		done
	else
		echo " [ no applets for: $1 ] "
	fi
	echo "<--"
}

install_applets "busybox"
install_applets "busybox.suid"
install_applets "coreutils"


# # # # # # # # # # # # # #
# preparing chroot sub-linux
cd ..
mkdir -p .chroot-system/lower0/
mv bin .chroot-system/lower0/
ln -s .chroot-system/lower0/bin
