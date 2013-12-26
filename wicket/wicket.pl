#!/usr/bin/env perl
#       wicket.pl
#       = Copyright 2014 Xiong Changnian  <xiong@cpan.org>   =
#       = Free Software = Artistic License 2.0 = NO WARRANTY =

use 5.014002;   # 5.14.3    # 2012  # pop $arrayref, copy s///r
use strict;
use warnings;
use version; our $VERSION = qv('0.0.0');

# Core modules
use Getopt::Long;                           # Parses command-line options
Getopt::Long::Configure ("bundling");       # enable, for instance, -xyz
use Pod::Usage;                             # Build help text from POD
use Pod::Find qw{pod_where};                # POD is in ...

# Modules standard with wheezy
use DBI 1.616;          # Generic interface to a large number of databases
use DBD::mysql;         # DBI driver for MySQL


# Disabled
#~ use lib qw| lib |;
#~ use Error::Base;
#~ use Perl6::Form;
#~ use Test::More;
#~ use Test::Trap;

#~ use Devel::Comments '###';
#~ use Devel::Comments '###', ({ -file => 'debug.log' });                   #~

#~ use DBIx::Connector; # Fast, safe DBI connection and transaction management
#~ use DBIx::Connector::Driver::SQLite; # SQLite-specific connection interface


## use
#============================================================================#
say "$0 Running...";

# Quickie grab from command line for security.
my @grab            = @ARGV;
my $dbpass            = $grab[0];


# Test constants.
my $indent          = q{ } x 4;

my $username        = 'Foo';
my $password        = 'barmeno';

my $dbname          = 'athens';
my $dbhost          = 'localhost';
my $dbuser          = 'wiki';
#~ my $dbpass            ;
my $dbtable         = 'athensuser';

my $dsn             = "DBI:mysql:database=$dbname;host=$dbhost";
my $dbh             ;
my $sth             ;
my $statement       ;


    # Test insert the user and set password.

# Connect to the DB.
$dbh = DBI->connect( $dsn, $dbuser, $dbpass );

#~ # Test query (ripped from DBD::mysql POD).
#~ $sth    = $dbh->prepare("SELECT * FROM athensuser");
#~ $sth->execute();
#~ while (my $ref = $sth->fetchrow_hashref()) {
#~     print "Found a row: id = $ref->{'user_id'}, name = $ref->{'user_name'}\n";
#~ }
#~ $sth->finish();

# Compose insert. 
$statement  = qq{INSERT INTO $dbtable }
            . q{(user_id, user_name) }
            . q{VALUES (}
            .  q{'0',}                          # user_id (auto_increment)
            . qq{$dbh->quote($username),}       # user_name
            .  q{)}
            ;
$dbh->do( $statement );

# Set password.
$statement  = qq{UPDATE $dbtable SET user_password=}
            .  q{md5(concat(user_id,'-',md5('}
            . $password
            .  q{'))) WHERE user_name ='}
            . $username
            .  q{'}
            ;
$dbh->do( $statement );

$dbh->disconnect();
say "Done.";
exit;
#----------------------------------------------------------------------------#


#============================================================================#
__END__     
