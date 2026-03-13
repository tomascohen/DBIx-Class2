use strict;
use warnings;

use Test::More;
use Test::Exception;
use lib qw(t/lib);
use DBICTest;

my $schema = DBICTest->init_schema();

# Track errors seen by __DIE__ handler (like SIP Trapper in Koha)
my @die_handler_errors;
local $SIG{__DIE__} = sub {
  push @die_handler_errors, $_[0] if $_[0] =~ /Unable to satisfy requested constraint/;
  die $_[0];  # Re-throw
};

# Regression test for get_from_storage with multiple unique constraints
# Bug: get_from_storage calls find() without specifying key => 'primary',
# causing find() to enter heuristics mode and try to satisfy ALL unique
# constraints. When the condition only contains primary key values, this
# throws "Unable to satisfy requested constraint" errors for other unique
# constraints.

subtest 'get_from_storage with single unique constraint (baseline)' => sub {
  my $bookmark = $schema->resultset('Bookmark')->create({ link => 1 });
  
  lives_ok {
    my $refreshed = $bookmark->get_from_storage;
    is($refreshed->id, $bookmark->id, 'Got same row back');
  } 'works with single unique constraint (primary key only)';
  
  $bookmark->delete;
};

subtest 'get_from_storage with multiple unique constraints' => sub {
  # Artist has: primary key (artistid) + unique on name + unique on (charfield, rank)
  my $artist = $schema->resultset('Artist')->create({
    name => 'Test Artist',
    rank => 10,
    charfield => 'testchar',
  });
  
  lives_ok {
    my $refreshed = $artist->get_from_storage;
    is($refreshed->artistid, $artist->artistid, 'Got same row back');
    is($refreshed->name, 'Test Artist', 'Name matches');
  } 'works with multiple unique constraints';
  
  $artist->delete;
};

subtest 'get_from_storage after modification' => sub {
  my $artist = $schema->resultset('Artist')->create({
    name => 'Modifiable Artist',
    rank => 5,
  });
  
  $artist->rank(6);
  
  lives_ok {
    my $refreshed = $artist->get_from_storage;
    is($refreshed->rank, 5, 'Got original value from storage');
  } 'works after object modification';
  
  $artist->delete;
};

subtest 'get_from_storage within transaction' => sub {
  my $artist = $schema->resultset('Artist')->create({
    name => 'Transactional Artist',
    rank => 7,
  });
  
  $schema->txn_do(sub {
    $artist->rank(8);
    
    lives_ok {
      my $refreshed = $artist->get_from_storage;
      is($refreshed->rank, 7, 'Got original value from storage');
    } 'works within transaction';
  });
  
  $artist->delete;
};

subtest 'get_from_storage with composite unique constraint' => sub {
  # Track has unique on (cd, position) and (cd, title)
  my $track = $schema->resultset('Track')->create({
    cd => 1,
    position => 99,
    title => 'Test Track',
  });
  
  lives_ok {
    my $refreshed = $track->get_from_storage;
    is($refreshed->trackid, $track->trackid, 'Got same row back');
  } 'works with composite unique constraints';
  
  $track->delete;
};

subtest 'discard_changes with multiple unique constraints' => sub {
  # discard_changes uses get_from_storage internally
  my $artist = $schema->resultset('Artist')->create({
    name => 'Discard Test',
    rank => 12,
  });
  
  $artist->name('Modified Name');
  $artist->rank(99);
  
  lives_ok {
    $artist->discard_changes;
    is($artist->name, 'Discard Test', 'Name was discarded');
    is($artist->rank, 12, 'Rank was discarded');
  } 'discard_changes works with multiple unique constraints';
  
  $artist->delete;
};

# The bug: even though find() catches these errors, __DIE__ handlers see them
is(scalar(@die_handler_errors), 0, 'No constraint errors should be thrown (even to __DIE__ handlers)') 
  or diag("Errors seen: " . join("\n", map { (split /\n/, $_)[0] } @die_handler_errors));

done_testing;
