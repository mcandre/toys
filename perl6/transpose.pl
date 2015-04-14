#!/usr/bin/env perl6

my @content = 'practice.txt'.IO.lines;

say 'raw content:';
say @content;

my $line;
my @matrix;
my $i;
my $j;

for @content {
  $line = $_;

  my @wordarray = $line.split(/\s+/);
  @matrix.push([@wordarray]);
}

say 'parsed matrix:';

loop ($i = 0; $i <= @matrix.end; $i++) {
  loop ($j = 0; $j <= @matrix[$i].end; $j++) {
    say "($i, $j): " ~ @matrix[$i][$j];
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

say 'transposed matrix:';

loop ($i = 0; $i <= @transposed.end; $i++) {
  loop ($j = 0; $j <= @transposed[$i].end; $j++) {
    print @transposed[$i][$j] ~ ' ';
  }

  say '';
}
