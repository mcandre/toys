#!/bin/sh
unset IFS
set -euf

rm -f /tmp/as.txt || :
rm -f /tmp/message-long.txt || :
rm -f /tmp/message-short.txt || :
