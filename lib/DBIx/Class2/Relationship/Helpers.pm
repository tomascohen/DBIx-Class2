package # hide from PAUSE
    DBIx::Class2::Relationship::Helpers;

use strict;
use warnings;

use base qw/DBIx::Class2/;

__PACKAGE__->load_components(qw/
    Relationship::HasMany
    Relationship::HasOne
    Relationship::BelongsTo
    Relationship::ManyToMany
/);

1;
