#!/usr/bin/perl
use warnings;

open FILE, 'practice.txt';
my @content = <FILE>;

print "raw content:\n @content\n\n";

my $line;
my @matrix;

for (my $i = 0; $i <= $#content; $i++) {
  #print "line $i:\n";
  $line = $content[$i];

  #print "$line\n";

  my @wordarray = split (/\s+/, $line);
  #print "word array: @wordarray\n";
  #print "index 0: @wordarray[0]\n";

  push @{$matrix}, \@wordarray;
}

print "parsed matrix:\n";

for (my $i = 0; $i < @$matrix; $i++) {
  for (my $j = 0; $j < @{$matrix->[$i]}; $j++) {
    print "($i, $j): $matrix->[$i][$j]\n";
  }
}

my @transposed = ();

# fill transposed matrix with empty strings for each coordinate
for (my $i = 0; $i < @$matrix; $i++) {
  my @zeroes = ();

  for (my $j = 0; $j < @{$matrix->[$i]}; $j++) {
    push @zeroes, " ";
  }

  push @{$transposed}, \@zeroes;
}

# transpose the matrix
for (my $i = 0; $i < @$matrix; $i++) {
  for (my $j = 0; $j < @{$matrix->[$i]}; $j++) {
    $transposed->[$j][$i] = $matrix->[$i][$j];
  }
}

print "transposed matrix:\n";

for (my $i = 0; $i < @$transposed; $i++) {
  for (my $j = 0; $j < @{$transposed->[$i]}; $j++) {
    print "$transposed->[$i][$j] ";
  }
  print "\n";
}
