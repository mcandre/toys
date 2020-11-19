#!/bin/sh
unset IFS
set -euf

rm -rf html || :
rm -rf latex || :

rm -rf bin || :
rm -rf Testing || :
rm Makefile || :

/usr/bin/find . \
    -iwholename '*cmake*' \
    -not -name CMakeLists.txt \
    -not -name clean-cmake.sh \
    -print \
    -exec rm -rf '{}' \; || :
