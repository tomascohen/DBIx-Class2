package DBICNSTest::RtBug41083::Result::Foo;
use strict;
use warnings;
use base 'DBIx::Class2::Core';
__PACKAGE__->table('foo');
__PACKAGE__->add_columns('foo');
1;
