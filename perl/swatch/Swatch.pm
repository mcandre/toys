#!/usr/bin/env perl
use strict;
use warnings;
use Time::gmtime;

# Andrew Pennebaker
# Copyright 2007 Andrew Pennebaker
#
# Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py
#
# Fixed: Mysterious slow upates, due to sec being added to UTC instead of $sec.

sub beat {
  my $utc = shift @_ || gmtime;

  my ($hour, $min, $sec) = ($utc->hour, $utc->min, $utc->sec);

  $utc = $hour * 3600 + $min * 60 + $sec; # Greenwich, England
  my $bmt = $utc + 3600; # Biel, Switzerland

  my $beat = $bmt / 86.4;

  if ($beat > 1000) {
    $beat -= 1000;
  }

  return $beat;
}

sub swatch {
  my $b = beat shift @_;
  return sprintf("@%06.2f", $b);
}

sub main {
  printf "%s\n", swatch;
}

main unless caller;
