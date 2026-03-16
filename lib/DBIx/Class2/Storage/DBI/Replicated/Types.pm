package # hide from PAUSE
  DBIx::Class2::Storage::DBI::Replicated::Types;

# DBIx::Class2::Storage::DBI::Replicated::Types - Types used internally by
# L<DBIx::Class2::Storage::DBI::Replicated>

# Workaround for https://rt.cpan.org/Public/Bug/Display.html?id=83336
use warnings;
use strict;

use MooseX::Types
  -declare => [qw/BalancerClassNamePart Weight DBICSchema DBICStorageDBI/];
use MooseX::Types::Moose qw/ClassName Str Num/;
use MooseX::Types::LoadableClass qw/LoadableClass/;

class_type 'DBIx::Class2::Storage::DBI';
class_type 'DBIx::Class2::Schema';

subtype DBICSchema, as 'DBIx::Class2::Schema';
subtype DBICStorageDBI, as 'DBIx::Class2::Storage::DBI';

subtype BalancerClassNamePart,
  as LoadableClass;

coerce BalancerClassNamePart,
  from Str,
  via {
    my $type = $_;
    $type =~ s/\A::/DBIx::Class2::Storage::DBI::Replicated::Balancer::/;
    $type;
  };

subtype Weight,
  as Num,
  where { $_ >= 0 },
  message { 'weight must be a decimal greater than 0' };

1;
