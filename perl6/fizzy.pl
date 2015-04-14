#!/usr/bin/env perl6

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

sub MAIN {
  my @fbs = 1 .. 100;

  for (0 .. 99) {
    @fbs[$_] = start {
      fizzy($_ + 1);
    }
  };

  for (@fbs) {
    my $r = $_.result;
    print "$r\n";
  }
}
