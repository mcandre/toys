#!/bin/sh
unset IFS
set -euf

rm -rf html || :
rm -rf latex || :
rm -f debug.log || :
rm -rf bin || :
rm -rf debug || :
rm -rf Testing || :
rm -f Makefile || :

/usr/bin/find . \
    -iwholename '*cmake*' \
    -not -name CMakeLists.txt \
    -not -name clean-cmake.sh \
    -print \
    -exec rm -rf '{}' \; || :
