package # hide from PAUSE
    DBIx::Class2::CDBICompat::Constructor;

use strict;
use warnings;

use base 'DBIx::Class2::CDBICompat::ImaDBI';

use Carp;
use DBIx::Class2::_Util qw(quote_sub perlstring);

__PACKAGE__->set_sql(Retrieve => <<'');
SELECT __ESSENTIAL__
FROM   __TABLE__
WHERE  %s

sub add_constructor {
    my ($class, $method, $fragment) = @_;

    croak("constructors needs a name") unless $method;

    carp("$method already exists in $class") && return
       if $class->can($method);

    quote_sub "${class}::${method}" => sprintf( <<'EOC', perlstring $fragment );
      my $self = shift;
      $self->sth_to_objects($self->sql_Retrieve(%s), \@_);
EOC
}

1;
