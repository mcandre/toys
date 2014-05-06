#!/usr/bin/env perl
use strict;
use warnings;

use Parallel::ForkManager;

sub fizzy {
  my $n = shift @_;

  my ($a, $b) = ($n % 3 == 0, $n % 5 == 0);

  if ($a && $b) {
    return "FizzBuzz";
  }
  elsif ($a) {
    return "Fizz";
  }
  elsif ($b) {
    return "Buzz";
  }
  else {
    return "$n";
  }
}

sub main {
  my $manager = new Parallel::ForkManager;

  my @fbs = 1 .. 100;

  foreach my $i (0 .. 99) {
    $manager->start and next;
    @fbs[$i] = fizzy($i + 1);
    $manager->finish;
  };

  foreach my $fb (@fbs) {
    print "$fb\n";
  }
}

main unless caller;
