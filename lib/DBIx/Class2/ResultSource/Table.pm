package DBIx::Class2::ResultSource::Table;

use strict;
use warnings;

use DBIx::Class2::ResultSet;

use base qw/DBIx::Class2/;
__PACKAGE__->load_components(qw/ResultSource/);

=head1 NAME

DBIx::Class2::ResultSource::Table - Table object

=head1 SYNOPSIS

=head1 DESCRIPTION

Table object that inherits from L<DBIx::Class2::ResultSource>.

=head1 METHODS

=head2 from

Returns the FROM entry for the table (i.e. the table name)

=cut

sub from { shift->name; }

=head1 FURTHER QUESTIONS?

Check the list of L<additional DBIC resources|DBIx::Class2/GETTING HELP/SUPPORT>.

=head1 COPYRIGHT AND LICENSE

This module is free software L<copyright|DBIx::Class2/COPYRIGHT AND LICENSE>
by the L<DBIx::Class2 (DBIC) authors|DBIx::Class2/AUTHORS>. You can
redistribute it and/or modify it under the same terms as the
L<DBIx::Class2 library|DBIx::Class2/COPYRIGHT AND LICENSE>.

=cut

1;
