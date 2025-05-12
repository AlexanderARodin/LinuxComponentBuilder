#!/bin/sh
set -e

[ -z $1 ] && exit 1
echo $1 | cut -d'.' -f2-
