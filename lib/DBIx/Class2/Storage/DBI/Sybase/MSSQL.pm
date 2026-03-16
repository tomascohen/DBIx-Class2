package DBIx::Class2::Storage::DBI::Sybase::MSSQL;

use strict;
use warnings;

use DBIx::Class2::Carp;
use namespace::clean;

carp 'Setting of storage_type is redundant as connections through DBD::Sybase'
    .' are now properly recognized and reblessed into the appropriate subclass'
    .' (DBIx::Class2::Storage::DBI::Sybase::Microsoft_SQL_Server in the'
    .' case of MSSQL). Please remove the explicit call to'
    .q/ $schema->storage_type('::DBI::Sybase::MSSQL')/
    .', as this storage class has been deprecated in favor of the autodetected'
    .' ::DBI::Sybase::Microsoft_SQL_Server';


use base qw/DBIx::Class2::Storage::DBI::Sybase::Microsoft_SQL_Server/;
use mro 'c3';

1;

=head1 NAME

DBIx::Class2::Storage::DBI::Sybase::MSSQL - (DEPRECATED) Legacy storage class for MSSQL via DBD::Sybase

=head1 NOTE

Connections through DBD::Sybase are now correctly recognized and reblessed
into the appropriate subclass (L<DBIx::Class2::Storage::DBI::Sybase::Microsoft_SQL_Server>
in the case of MSSQL). Please remove the explicit storage_type setting from your
schema.

=head1 SYNOPSIS

This subclass supports MSSQL connected via L<DBD::Sybase>.

  $schema->storage_type('::DBI::Sybase::MSSQL');
  $schema->connect_info('dbi:Sybase:....', ...);

=head1 FURTHER QUESTIONS?

Check the list of L<additional DBIC resources|DBIx::Class2/GETTING HELP/SUPPORT>.

=head1 COPYRIGHT AND LICENSE

This module is free software L<copyright|DBIx::Class2/COPYRIGHT AND LICENSE>
by the L<DBIx::Class2 (DBIC) authors|DBIx::Class2/AUTHORS>. You can
redistribute it and/or modify it under the same terms as the
L<DBIx::Class2 library|DBIx::Class2/COPYRIGHT AND LICENSE>.
