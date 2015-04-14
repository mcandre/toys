#!/usr/bin/env perl6

my @content = 'practice.txt'.IO.lines;

print "raw content:\n";
print @content ~ "\n\n";

my $line;
my @matrix;
my $i;
my $j;

for @content {
  $line = $_;

  # print "$line\n";

  my @wordarray = $line.split(/\s+/);

  # print "word array: " ~ @wordarray ~ "\n";
  # print "index 0: @wordarray[0]\n";
  # print "index 1: @wordarray[1]\n";
  # print "index 2: @wordarray[2]\n";

  @matrix.push([@wordarray]);
}

print "parsed matrix:\n";

loop ($i = 0; $i <= @matrix.end; $i++) {
  loop ($j = 0; $j <= @matrix[$i].end; $j++) {
    print "($i, $j): " ~ @matrix[$i][$j] ~ "\n";
  }
}

my @transposed;

# fill transposed matrix with empty strings for each coordinate
loop ($i = 0; $i < @matrix.end; $i++) {
  my @zeroes;

  loop ($j = 0; $j <= @matrix[$i].end; $j++) {
    @zeroes.push('0');
  }

  @transposed.push([@zeroes]);
}

# transpose the matrix
loop ($i = 0; $i <= @matrix.end; $i++) {
  loop ($j = 0; $j <= @matrix[$i].end; $j++) {
    @transposed[$j][$i] = @matrix[$i][$j];
  }
}

print "transposed matrix:\n";

loop ($i = 0; $i <= @transposed.end; $i++) {
  loop ($j = 0; $j <= @transposed[$i].end; $j++) {
    print @transposed[$i][$j] ~ ' ';
  }

  print "\n";
}
