package DBICNSTest::Bogus::A;

use warnings;
use strict;

use base qw/DBIx::Class2::Core/;
__PACKAGE__->table('a');
__PACKAGE__->add_columns('a');
1;
