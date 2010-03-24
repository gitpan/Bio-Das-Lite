#########
# Author:        rmp
# Last Modified: $Date: 2010-03-24 19:29:46 +0000 (Wed, 24 Mar 2010) $ $Author: zerojinx $
# Id:            $Id: 50-entry_points.t 19 2010-03-24 19:29:46Z zerojinx $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/50-entry_points.t,v $
# $HeadURL: https://zerojinx@bio-das-lite.svn.sourceforge.net/svnroot/bio-das-lite/trunk/t/50-entry_points.t $
#
package entry_points;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 19 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/entry_points.xml',
				});
my $ep       = $das->entry_points();
my $results  = (values %{$ep})[0];

is(scalar @{$results->[0]->{'segment'}}, 22, 'Correct number of segments returned');

1;
