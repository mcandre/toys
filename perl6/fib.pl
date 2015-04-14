#!/usr/bin/env perl6

sub fib {
  my ($n) = @_;

  if ($n < 2) {
    return $n;
  }
  else {
    my ($a, $b) = (0, 1);

    my $m = $n - 1;

    loop (my $i = 0; $i < $m; $i++) {
      ($a, $b) = ($b, $a + $b);
    }

    return $b;
  }
}

# recursion overhead is slow

# sub fib {
#   my ($n) = @_;

#   if ($n == 0) {
#     return 0;
#   }
#   elsif ($n == 1) {
#     return 1;
#   }
#   else {
#     return fib($n - 1) + fib($n - 2);
#   }
# }

my $n = @*ARGS[0];

print "N= $n\n";

print "Running\n" ;

my $startt = time;

my $x = fib($n);

my $endt = time;

print "Fib $n = $x\n";

print "Time: " ~ ($endt - $startt) ~ " sec\n";
