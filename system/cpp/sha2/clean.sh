#!/bin/sh
unset IFS
set -euf
./clean-fixtures.sh || :
./clean-bin.sh || :
./clean-cmake.sh || :
