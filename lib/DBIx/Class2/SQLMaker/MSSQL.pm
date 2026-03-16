package # Hide from PAUSE
  DBIx::Class2::SQLMaker::MSSQL;

use warnings;
use strict;

use base qw( DBIx::Class2::SQLMaker );

#
# MSSQL does not support ... OVER() ... RNO limits
#
sub _rno_default_order {
  return \ '(SELECT(1))';
}

1;
