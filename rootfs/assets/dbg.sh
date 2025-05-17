#!/bin/sh
set -e

SUB_ROOT='/.chroot-system'
  LOWER0="$SUB_ROOT/lower0"
  LOWER1="$SUB_ROOT/lower_sqsh"
   UPPER="$SUB_ROOT/upper"
    WORK="$SUB_ROOT/work"
FRONTEND_ROOT="$SUB_ROOT/frontend-root"

# # # # # # # # # # # # # #
# anothers
modprobe -a loop squashfs overlay

mkdir -p $LOWER1
mount -t squashfs /vifm.tcz $LOWER1

mkdir -p $UPPER
mkdir -p $WORK
mkdir -p $FRONTEND_ROOT

mount -t overlay \
	-o lowerdir=$LOWER0/:$LOWER1/,upperdir=$UPPER/,workdir=$WORK/ \
	none $FRONTEND_ROOT

#chroot $FRONTEND_ROOT /bin/sh
