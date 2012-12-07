#!/usr/bin/env factor

USING: namespaces io sequences command-line ;
IN: args

: main ( -- ) command-line get [ print ] each ;

MAIN: main