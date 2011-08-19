#! /usr/bin/env factor

USING: io sequences command-line ;
IN: args

: main ( -- ) (command-line) [ print ] each ;

MAIN: main