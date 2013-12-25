#!/usr/bin/env perl
#       wicket.pl
#       = Copyright 2014 Xiong Changnian  <xiong@cpan.org>   =
#       = Free Software = Artistic License 2.0 = NO WARRANTY =

use 5.014002;   # 5.14.3    # 2012  # pop $arrayref, copy s///r
use strict;
use warnings;
use version; our $VERSION = qv('0.0.0');

use Getopt::Long;                           # Parses command-line options
Getopt::Long::Configure ("bundling");       # enable, for instance, -xyz
use Pod::Usage;                             # Build help text from POD
use Pod::Find qw{pod_where};                # POD is in ...

#~ use lib qw| lib |;
#~ use Error::Base;
#~ use Perl6::Form;
#~ use Test::More;
#~ use Test::Trap;

#~ use Devel::Comments '###';
#~ use Devel::Comments '###', ({ -file => 'debug.log' });                   #~

## use
#============================================================================#
say "$0 Running...";



say "Done.";
exit;
#----------------------------------------------------------------------------#


#============================================================================#
__END__     
