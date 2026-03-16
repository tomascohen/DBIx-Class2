package DBIx::Class2::PK::Auto;

#use base qw/DBIx::Class2::PK/;
use base qw/DBIx::Class2/;
use strict;
use warnings;

1;

__END__

=head1 NAME

DBIx::Class2::PK::Auto - Automatic primary key class

=head1 SYNOPSIS

use base 'DBIx::Class2::Core';
__PACKAGE__->set_primary_key('id');

=head1 DESCRIPTION

This class overrides the insert method to get automatically incremented primary
keys.

PK::Auto is now part of Core.

See L<DBIx::Class2::Manual::Component> for details of component interactions.

=head1 LOGIC

C<PK::Auto> does this by letting the database assign the primary key field and
fetching the assigned value afterwards.

=head1 METHODS

=head2 insert

The code that was handled here is now in Row for efficiency.

=head2 sequence

The code that was handled here is now in ResultSource, and is being proxied to
Row as well.

=head1 FURTHER QUESTIONS?

Check the list of L<additional DBIC resources|DBIx::Class2/GETTING HELP/SUPPORT>.

=head1 COPYRIGHT AND LICENSE

This module is free software L<copyright|DBIx::Class2/COPYRIGHT AND LICENSE>
by the L<DBIx::Class2 (DBIC) authors|DBIx::Class2/AUTHORS>. You can
redistribute it and/or modify it under the same terms as the
L<DBIx::Class2 library|DBIx::Class2/COPYRIGHT AND LICENSE>.
