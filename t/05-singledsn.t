#########
# Author:        rmp
# Last Modified: $Date: 2010-04-16 12:33:14 +0100 (Fri, 16 Apr 2010) $ $Author: andyjenkinson $
# Id:            $Id: 05-singledsn.t 33 2010-04-16 11:33:14Z andyjenkinson $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/05-singledsn.t,v $
# $HeadURL: https://zerojinx@bio-das-lite.svn.sourceforge.net/svnroot/bio-das-lite/trunk/t/05-singledsn.t $
#
package singledsn;
use strict;
use warnings;
use Test::More tests => 30;
use Bio::Das::Lite;

our $VERSION = do { my @r = (q$Revision: 33 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

$Bio::Das::Lite::DEBUG = 0;

for my $service ('http://das.sanger.ac.uk/das',
		 'http://das.ensembl.org/das/dsn',
		 'http://das.ensembl.org/das/dsn#foo') {

  #########
  # test single dsn from constructor
  #
  my $das     = Bio::Das::Lite->new({'dsn' => $service, 'timeout' => 10});
  ok(defined $das,                  'new with a single dsn returned something');
  ok(ref($das->dsn()) eq 'ARRAY',   'single service get gave an array ref');
  ok(scalar (@{$das->dsn()}) == 1,  'single service get had length of one');
  ok($das->dsn->[0] eq $service,    'single service get returned the same dsn');

  my $dsns = $das->dsns();
  ok(defined $dsns,                 'dsns call returned something');
  ok(ref($dsns) eq 'HASH',          'dsns call gave a hash');
  my @keys = keys %{$dsns};
  ok(scalar @keys == 1,             'dsns call gave one key');
  my $key = $keys[0];
  ok(ref($dsns->{$key}) eq 'ARRAY', 'dsns call gave a arrayref value for the one key');
  my @sources = @{$dsns->{$key}};
  ok(scalar @sources > 0,           'dsns call returned at least one source');
  my @broken = grep { ref($_) ne 'HASH' } @sources;
  ok(scalar @broken == 0,           'all sources parsed correctly into hashes');
}

1;
