#!/usr/bin/env perl6
print IO::Path.new($*PROGRAM_NAME).dirname ~ "\n";
