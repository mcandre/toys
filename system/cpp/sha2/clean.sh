#!/bin/sh
unset IFS
set -euf
./clean-bin.sh || :
./clean-cmake.sh || :
