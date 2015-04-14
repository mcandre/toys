#!/usr/bin/env perl6

my $parser = 'http://yubnub.org/parser/parse?command=';
my $command = @*ARGS.join('+');

print "Command: $command\n";

shell "open $parser$command";
