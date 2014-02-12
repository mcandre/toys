#!/usr/bin/env perl
use strict;
use warnings;
use Time::gmtime;
use DateTime::Format::HTTP;
use Swatch qw(beat swatch);
use Test::More qw(no_plan);

my $time = DateTime::Format::HTTP->parse_datetime("Thu Feb  3 17:03:55 GMT 1994");
my $s = swatch gmtime $time;

is($s, "\@064.75");
