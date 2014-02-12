# swatch - It's Internet Time!

# EXAMPLE

    $ perl Swatch.pm 
    @791.71

    $ perl Swatch.pm 
    @791.72

    $ perl Swatch.pm 
    @791.73

    ...

# REQUIREMENTS

* [Perl](http://www.perl.org/)
* [CPAN](http://www.cpan.org/)
* [Test::More](http://search.cpan.org/~rjbs/Test-Simple/lib/Test/More.pm)

# TESTING

    $ perl Makefile.PL 
    Warning: Guessing NAME [swatch] from current directory name.
    Writing Makefile for swatch
    Writing MYMETA.yml and MYMETA.json

    $ make test
    Skip blib/lib/Swatch.pm (unchanged)
    PERL_DL_NONLAZY=1 /usr/bin/perl "-MExtUtils::Command::MM" "-e" "test_harness(0, 'blib/lib', 'blib/arch')" t/*.t
    t/Swatch.t .. Argument "1994-02-03T17:03:55" isn't numeric in gmtime at /System/Library/Perl/5.16/Time/gmtime.pm line 33.
    t/Swatch.t .. ok   
    All tests successful.
    Files=1, Tests=1,  1 wallclock secs ( 0.02 usr  0.01 sys +  0.11 cusr  0.01 csys =  0.15 CPU)
    Result: PASS
