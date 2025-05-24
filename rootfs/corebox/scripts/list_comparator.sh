#!/bin/sh
set -e
set -x

LIST_FILE="assets/$1.chck_lst"
BIN_FILE="target/root_fs/bin/$1"
diff <(ls /) <(ls ~)
#diff <(cat $LIST_FILE) <($BIN_FILE --list)
