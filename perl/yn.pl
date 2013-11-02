#!/usr/bin/env perl -w

$parser = "http://yubnub.org/parser/parse?command=";
$command = $command = join "+", @ARGV;

print "Command: $command\n";

system "open ${parser}${command}";
