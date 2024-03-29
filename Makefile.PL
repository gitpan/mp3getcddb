use 5.006;
use strict;
use ExtUtils::MakeMaker;
use Config;

my @scripts = qw(mp3getcddb);
my $usrbin = "/usr/bin";
my $installscript = $Config{installscript};

print STDERR <<EOD unless $installscript eq $usrbin;

WARNING: This Makefile will install user accessible scripts.
The location for these scripts is $installscript.
You may consider to pass INSTALLSCRIPT=$usrbin (or some other
convenient location) to "make install".

EOD

WriteMakefile(
    NAME		=> 'mp3getcddb',
    VERSION_FROM	=> 'script/mp3getcddb',
    PREREQ_PM		=> { 'Getopt::Long' => 2.33,
			     'Test::More' => 0.00,
			     'MP3::Info' => 1.02,
			     'CDDB' => 1.08,
			   },
   EXE_FILES		=> [ map { "script/$_" } @scripts ],
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'script/mp3getcddb', # retrieve abstract from module
       AUTHOR        => 'Johan Vromans <jv@cpan.org>') : ()),
);


