package DBIx::Class2::Core;

use strict;
use warnings;

use base qw/DBIx::Class2/;

__PACKAGE__->load_components(qw/
  Relationship
  InflateColumn
  PK::Auto
  PK
  Row
  ResultSourceProxy::Table
/);

1;

__END__

=head1 NAME

DBIx::Class2::Core - Core set of DBIx::Class2 modules

=head1 SYNOPSIS

  # In your result (table) classes
  use base 'DBIx::Class2::Core';

=head1 DESCRIPTION

This class just inherits from the various modules that make up the
L<DBIx::Class2> core features.  You almost certainly want these.

The core modules currently are:

=over 4

=item L<DBIx::Class2::InflateColumn>

=item L<DBIx::Class2::Relationship> (See also L<DBIx::Class2::Relationship::Base>)

=item L<DBIx::Class2::PK::Auto>

=item L<DBIx::Class2::PK>

=item L<DBIx::Class2::Row>

=item L<DBIx::Class2::ResultSourceProxy::Table> (See also L<DBIx::Class2::ResultSource>)

=back

A better overview of the methods found in a Result class can be found
in L<DBIx::Class2::Manual::ResultClass>.

=head1 FURTHER QUESTIONS?

Check the list of L<additional DBIC resources|DBIx::Class2/GETTING HELP/SUPPORT>.

=head1 COPYRIGHT AND LICENSE

This module is free software L<copyright|DBIx::Class2/COPYRIGHT AND LICENSE>
by the L<DBIx::Class2 (DBIC) authors|DBIx::Class2/AUTHORS>. You can
redistribute it and/or modify it under the same terms as the
L<DBIx::Class2 library|DBIx::Class2/COPYRIGHT AND LICENSE>.
