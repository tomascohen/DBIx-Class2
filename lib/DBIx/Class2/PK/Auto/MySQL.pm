package # hide package from pause
  DBIx::Class2::PK::Auto::MySQL;

use strict;
use warnings;

use base qw/DBIx::Class2/;

__PACKAGE__->load_components(qw/PK::Auto/);

1;

__END__

=head1 NAME

DBIx::Class2::PK::Auto::MySQL - (DEPRECATED) Automatic primary key class for MySQL

=head1 SYNOPSIS

Just load PK::Auto instead; auto-inc is now handled by Storage.

=head1 FURTHER QUESTIONS?

Check the list of L<additional DBIC resources|DBIx::Class2/GETTING HELP/SUPPORT>.

=head1 COPYRIGHT AND LICENSE

This module is free software L<copyright|DBIx::Class2/COPYRIGHT AND LICENSE>
by the L<DBIx::Class2 (DBIC) authors|DBIx::Class2/AUTHORS>. You can
redistribute it and/or modify it under the same terms as the
L<DBIx::Class2 library|DBIx::Class2/COPYRIGHT AND LICENSE>.
