package     # hide from PAUSE
    DBIx::Class2::Admin::Descriptive;

use warnings;
use strict;

use base 'Getopt::Long::Descriptive';

require DBIx::Class2::Admin::Usage;
sub usage_class { 'DBIx::Class2::Admin::Usage'; }

1;
