#!/usr/bin/env octave -qf
#
# Example:
#
#$ ./args.m a b c
#  1
# a
#  2
# b
#  3
# c

A = argv();

for i = 1:nargin
    disp(i);
    disp(A{i});
endfor
