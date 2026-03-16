package # hide from PAUSE
    DBIx::Class2::ClassResolver::PassThrough;

use strict;
use warnings;

sub class {
  shift;
  return shift;
}

1;
