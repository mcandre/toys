#!/usr/bin/env perl

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile;

sub MY::postamble {
	return <<'END';
perlwarn:
	-find . -type f -name '*.p[lm]' -o -name '*.t' -exec perl -MO=Lint -cw {} 2>&1 \; | grep -v "syntax OK" | grep -v "Can't locate"

perlcritic:
	-perlcritic -q .

lint: perlwarn perlcritic
END
}
