#########
# Author:        rmp
# Last Modified: $Date: 2010-03-24 19:29:46 +0000 (Wed, 24 Mar 2010) $ $Author: zerojinx $
# Id:            $Id: 60-features_empty.t 19 2010-03-24 19:29:46Z zerojinx $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/60-features_empty.t,v $
# $HeadURL: https://zerojinx@bio-das-lite.svn.sourceforge.net/svnroot/bio-das-lite/trunk/t/60-features_empty.t $
#
package features_empty;
use strict;
use warnings;
use Test::More tests => 5;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 19 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'http://foo/das/bar',
				 'filedata' => 't/features-empty.xml',
				});
my $features = $das->features();
my $results  = (values %{$features})[0];

is(ref($results),                 'HASH', 'Empty segment gives a hash with seginfo rather than an empty array of features');
is($results->{'segment_id'},      10,     'segment_id');
is($results->{'segment_version'}, 18,     'segment_version');
is($results->{'segment_start'},   1,      'segment_start');
is($results->{'segment_stop'},    1000,   'segment_stop');

1;
