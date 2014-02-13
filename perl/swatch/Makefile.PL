#!/usr/bin/env perl

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile;

sub MY::postamble {
  return <<'END';
perlwarn:
	-find . -type f -name '*.pl' -exec perl -MO=Lint -cw {} 2>&1 \; | grep -v "syntax OK" | grep -v "Can't locate"
	-find . -type f -name '*.pm' -exec perl -MO=Lint -cw {} 2>&1 \; | grep -v "syntax OK" | grep -v "Can't locate"
	-find . -type f -name '*.t' -exec perl -MO=Lint -cw {} 2>&1 \; | grep -v "syntax OK" | grep -v "Can't locate"

perlcritic:
	-perlcritic -q .

lint: perlwarn perlcritic
END
}
