package # Hide from PAUSE
  DBIx::Class2::SQLMaker::SQLite;

use warnings;
use strict;

use base qw( DBIx::Class2::SQLMaker );

#
# SQLite does not understand SELECT ... FOR UPDATE
# Disable it here
sub _lock_select () { '' };

1;
