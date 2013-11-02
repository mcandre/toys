#!/usr/bin/env perl -w

use strict;

sub rot13 {
  my $plaintext = shift @_;

  my $ciphertext = $plaintext;
  $ciphertext =~ tr/[a-zA-Z]/[n-za-mN-ZA-M]/;

  return $ciphertext;
}

sub main {
  while (<>) {
    print rot13($_);
  }
}

main unless caller;
