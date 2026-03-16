package DBICNSTest::Result::B;

use warnings;
use strict;

use base qw/DBIx::Class2::Core/;
__PACKAGE__->table('b');
__PACKAGE__->add_columns('b');
1;
