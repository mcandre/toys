#!/usr/bin/env perl -sw

use strict;
use warnings;

# Andrew Pennebaker
# Copyright 2007 Andrew Pennebaker
#
# Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py

# Fixed: Mysterious slow upates, due to sec being added to UTC instead of $sec.

use strict;

use Time::gmtime;

sub beat {
  my $utc = gmtime();

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
  return sprintf("@%06.2f", beat);
}

sub main {
  printf "%s\n", swatch;
}

main unless caller;
