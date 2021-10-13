#!/bin/sh
unset IFS
set -euf

rm -rf html || :
rm -rf latex || :
rm -f debug.log || :
rm -f install_manifest.txt || :
rm -rf debug || :
rm -rf Testing || :
rm -f Makefile || :
rm -rf x64 || :
rm -rf CMakeFiles || :
rm -f CMakeCache.txt || :
rm -f cmake_install.cmake || :
rm -f CTestTestfile.cmake || :

/usr/bin/find . \
    -name '*.vcxproj*' \
    -print \
    -exec rm -f '{}' \; || :

/usr/bin/find . \
    -name '*.sln' \
    -print \
    -exec rm -f '{}' \; || :

/usr/bin/find . \
    -name '*.dir' \
    -print \
    -exec rm -rf '{}' \; || :
