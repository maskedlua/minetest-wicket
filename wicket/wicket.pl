#!/usr/bin/env perl
#       wicket.pl
#       = Copyright 2014 Xiong Changnian  <xiong@cpan.org>   =
#       = Free Software = Artistic License 2.0 = NO WARRANTY =

use 5.014002;   # 5.14.3    # 2012  # pop $arrayref, copy s///r
use strict;
use warnings;
use version; our $VERSION = qv('0.0.0');

# Core module
use lib qw| lib |;

# Project module
use Local::Wicket;

## use
#============================================================================#
say "$0 Running...";



say "Done.";
exit;
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

=pod

# Quickie grab from command line for security.
my @grab            = @ARGV;
my $dbpass            = $grab[0];


# Test constants.
my $indent          = q{ } x 4;

my $username        = 'Foo';
my $password        = 'barmeno';
my $hashed          ;

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

# Hash the password. See: 
#   https://www.mediawiki.org/wiki/Manual:User_table#user_password
my $salt    = sprintf "%08x", ( int( rand() * 2**31 ) );
$hashed     = md5_hex( $password );
$hashed     = md5_hex( $salt . q{-} . $hashed );
$hashed     = q{:B:} . $salt . q(:) . $hashed  ;

# Compose insert. 
$statement  = qq{INSERT INTO $dbtable }
            .  q{(user_id, user_name) }
            .  q{VALUES (}
            .  q{'0',}                          # user_id (auto_increment)
            . $dbh->quote($username)            # user_name
            .  q{)}
            ;
$dbh->do( $statement );

# Set password.
$statement  = qq{UPDATE $dbtable SET user_password=}
            . $dbh->quote($hashed)
            .  q{ WHERE user_name =}
            . $dbh->quote($username)
            ;
$dbh->do( $statement );

$dbh->disconnect();
say "Done.";
exit;
#----------------------------------------------------------------------------#


#============================================================================#
__END__     
