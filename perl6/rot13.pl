#!/usr/bin/env perl6

sub rot13 {
    my $plaintext = shift @_;

    my $ciphertext = $plaintext;
    $ciphertext ~~ tr/[a..zA..Z]/[n..za..mN..ZA..M]/;

    return $ciphertext;
}

sub MAIN {
    for (lines) {
        say rot13($_);
    }
}
