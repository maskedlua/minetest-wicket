package Local::Wicket;
use 5.014002;   # 5.14.3    # 2012  # pop $arrayref, copy s///r
use strict;
use warnings;
use version; our $VERSION = qv('v0.0.0');

# Core modules
use Getopt::Long;                           # Parses command-line options
Getopt::Long::Configure ("bundling");       # enable, for instance, -xyz
use Pod::Usage;                             # Build help text from POD
use Pod::Find qw{pod_where};                # POD is in ...

use Digest::MD5 qw(md5 md5_hex md5_base64);     # MD5 hashing

# Modules standard with wheezy
use DBI 1.616;          # Generic interface to a large number of databases
use DBD::mysql;         # DBI driver for MySQL

# Alternate uses
#~ use Devel::Comments '###', ({ -file => 'debug.log' });                   #~

## use
#============================================================================#

# Pseudo-globals

# Compiled regexes
our $QRFALSE            = qr/\A0?\z/            ;
our $QRTRUE             = qr/\A(?!$QRFALSE)/    ;

## pseudo-globals
#----------------------------------------------------------------------------#

#=========# INTERNAL ROUTINE
#
#~     _insert({       # insert this user directly into the wiki database
#~         username    => $username,   # (game) user to insert
#~         password    => $password,   # temporary password given to game user
#~         dbname      => $dbname,     # name of the wiki's MySQL DB
#~         dbuser      => $dbuser,     # same as the wiki's DB user
#~         dbpass      => $dbpass,     # DB password for above
#~         dbtable     => $dbtable,    # name of the "user" table
#~     });
#       
# Pass named parms in a hashref.
# Host 'localhost' is assumed.
# 
sub _insert {
    
    
    
}; ## _insert

#=========# INTERNAL ROUTINE
#
#   _do_();     # short
#       
# Purpose   : ____
# Parms     : ____
# Reads     : ____
# Returns   : ____
# Writes    : ____
# Throws    : ____
# See also  : ____
# 
# ____
# 
sub _do_ {
    
    
    
}; ## _do_



## END MODULE
1;
#============================================================================#
__END__

=head1 NAME

Local::Wicket - Minetest-Mediawiki bridge

=head1 VERSION

This document describes Local::Wicket version v0.0.0

=head1 SYNOPSIS

    use Local::Wicket;

=head1 DESCRIPTION

=over

I< One day the war will be over. > 
-- Lt. Colonel Nicholson

=back



=head1 PUBLIC FUNCTIONS 

=head2 new()

=head1 PRIVATE FUNCTIONS

No user-accessible parts in here. 

=head1 SEE ALSO

L<< Some::Module|Some::Module >>

=head1 INSTALLATION

Do not install this module at all. It's only meaningful as part of the 'wicket' Minetest mod (addon, plugin, extension). Refer to mod docs. 

=head1 DIAGNOSTICS

=over

=item C<< some error message >>

Some explanation. 

=back

=head1 CONFIGURATION AND ENVIRONMENT

None. 

=head1 DEPENDENCIES

There are no non-core dependencies. 

=begin html

<!--

=end html

L<< version|version >> 0.99 E<10> E<8> E<9>
Perl extension for Version Objects

=begin html

-->

<DL>

<DT>    <a href="http://search.cpan.org/perldoc?version" 
            class="podlinkpod">version</a> 0.99 
<DD>    Perl extension for Version Objects

</DL>

=end html

This module requires perl 5.14.2;
maybe exactly perl (5.14.2-21+deb7u1). 

=head1 INCOMPATIBILITIES

None known.

=head1 BUGS AND LIMITATIONS

This is an early release. Reports and suggestions will be warmly welcomed. 

Please report any issues to: 
L<https://github.com/Xiong/minetest-wicket/issues>.

=head1 DEVELOPMENT

This project is hosted on GitHub at: 
L<https://github.com/Xiong/minetest-wicket>. 

=head1 THANKS

Somebody helped!

=head1 AUTHOR

Xiong Changnian C<< <xiong@cpan.org> >>

=head1 LICENSE

Copyright (C) 2013 
Xiong Changnian C<< <xiong@cpan.org> >>

This library and its contents are released under Artistic License 2.0:

L<http://www.opensource.org/licenses/artistic-license-2.0.php>

=begin fool_pod_coverage

No, I'm not just lazy. I think it's counterproductive to give each accessor 
its very own section. Sorry if you disagree. 

=head2 put_attr

=head2 get_attr

=end   fool_pod_coverage

=cut





