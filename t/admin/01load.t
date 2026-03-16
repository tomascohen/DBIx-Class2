use strict;
use warnings;

use Test::More;

use lib 't/lib';
use DBICTest;

BEGIN {
    require DBIx::Class2;
    plan skip_all => 'Test needs ' . DBIx::Class2::Optional::Dependencies->req_missing_for('admin')
      unless DBIx::Class2::Optional::Dependencies->req_ok_for('admin');
}

use_ok 'DBIx::Class2::Admin';


done_testing;
