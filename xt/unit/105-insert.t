use strict;
use warnings;

use Test::More;

use Local::Wicket;
my $QRTRUE       = $Local::Wicket::QRTRUE    ;
my $QRFALSE      = $Local::Wicket::QRFALSE   ;

#----------------------------------------------------------------------------#
# insert.t
#
# Create a test database and do a test user insert.
#----------------------------------------------------------------------------#
# SETUP
my $username    = 'Joe';                # (game) user to insert
my $password    = 'flimflam';           # temporary password given to user
my $dbname      = 'test';               # name of the wiki's MySQL DB
my $dbuser      = 'testdbuser';         # same as the wiki's DB user
my $dbpass      = 'testdbpass';         # DB password for above
my $dbtable     = 'test_users';         # name of the "user" table


#----------------------------------------------------------------------------#
# CASES

my @td  = (
    {
        -case   => 'null',
        -like   => $QRTRUE,
    },
    
    {
        -case   => 'Joe',
        -args   => [ 
            username    => $username,   # 
            password    => $password,   # 
            dbname      => $dbname,     # 
            dbuser      => $dbuser,     # 
            dbpass      => $dbpass,     # 
            dbtable     => $dbtable,    # 
        ],
        -like   => $QRTRUE,
    },
    
    {
        -case   => 'Freddy',
        -args   => [ 
            username    => $username,   # 
            password    => $password,   # 
            dbname      => $dbname,     # 
            dbuser      => 'Freddy',    # BAD
            dbpass      => $dbpass,     # 
            dbtable     => $dbtable,    # 
        ],
        -die    => words(qw/ error /),
    },
    
#~     {
#~         -case   => 'two',
#~         -args   => [ 0, 1 ],
#~     },
#~     
#~     {
#~         -case   => 'three',
#~         -args   => [ qw/ a b c / ],
#~         -die    => words(qw/ internal error unpaired /),
#~     },
#~     
#~     {
#~         -case   => 'four',
#~         -args   => [ qw/ a b c d / ],
#~     },
    
);

#----------------------------------------------------------------------------#

my $tc          ;
my $base        = 'Local::Wicket: _insert ';
my $diag        = $base;
my @rv          ;
my $got         ;
my $want        ;

#----------------------------------------------------------------------------#

# Extra-verbose dump optional for test script debug.
my $Verbose     = 0;
#~    $Verbose++;

for (@td) {
    $tc++;
    my %t           = %{ $_ };
    my $case        = $base . $t{-case};
    
    note( "---- $case" );
    subtest $case => sub {
        
        my @args        = eval{ @{ $t{-args} } };
        my $die         = $t{-die};     # must fail
        my $like        = $t{-like};    # regex supplied
        my $need        = $t{-need};    # exact return value supplied
        
        $diag           = 'execute';
        @rv             = eval{ Local::Wicket::_insert(@args) };
        pass( $diag );          # test didn't blow up
        my $err         = $@;
        note($err) if $err;     # did code under test blow up?
        
        if ( $err and not $die ) {
            $diag           = 'eval error';
            fail( $diag );
        };
        
        if    ($die) {
            $diag           = 'should throw';
            $got            = $err;
            $want           = $die;
            like( $got, $want, $diag );
        }
        elsif ($like) {
            $diag           = 'return-like';
            $got            = join qq{\n}, @rv;
            $want           = $like;
            like( $got, $want, $diag );
        } 
        elsif ($need) {
            $diag           = 'return-is';
            $got            = $rv[0];
            $want           = $need;
            is( $got, $want, $diag );
        };
        
        # Extra-verbose dump optional for test script debug.
        if ( $Verbose >= 1 ) {
            note( 'explain: ', explain \@rv     );
            note( ''                            );
        };
        
    }; ## subtest
}; ## for

#----------------------------------------------------------------------------#
# TEARDOWN

done_testing($tc);
exit 0;

#============================================================================#

sub words {                         # sloppy match these strings
    my @words   = @_;
    my $regex   = q{};
    
    for (@words) {
        $regex  = $regex . $_ . '.*';
    };
    
    return qr/$regex/is;
};

__END__
