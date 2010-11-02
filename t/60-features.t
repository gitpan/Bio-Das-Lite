#########
# Author:        rmp
# Last Modified: $Date: 2010-03-24 19:29:46 +0000 (Wed, 24 Mar 2010) $ $Author: zerojinx $
# Id:            $Id: 60-features.t 19 2010-03-24 19:29:46Z zerojinx $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/60-features.t,v $
# $HeadURL: https://bio-das-lite.svn.sourceforge.net/svnroot/bio-das-lite/tags/spec-1.53/t/60-features.t $
#
package features;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 19 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/features.xml',
				});
my $features = $das->features();
my $results  = (values %{$features})[0];

is(scalar @{$results}, 102, 'Whole-response-mode gave correct number of features returned');

1;
