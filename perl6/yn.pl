#!/usr/bin/env perl6

my $parser = 'http://yubnub.org/parser/parse?command=';
my $command = @*ARGS.join('+');

say "Command: $command";

shell "open $parser$command";
