#########
# Author:        rmp
# Last Modified: $Date: 2010-03-24 19:29:46 +0000 (Wed, 24 Mar 2010) $ $Author: zerojinx $
# Id:            $Id: 61-features_group.t 19 2010-03-24 19:29:46Z zerojinx $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/61-features_group.t,v $
# $HeadURL: https://bio-das-lite.svn.sourceforge.net/svnroot/bio-das-lite/tags/spec-1.53/t/61-features_group.t $
#
package features_group;
use strict;
use warnings;
use Test::More tests => 5;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 19 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/features-group.xml',
				});
my $features = $das->features();
my $results  = (values %{$features})[0];

my $first_feature_group_data = $results->[0]->{'group'}->[0];
is(scalar @{$first_feature_group_data->{'link'}},      2,                     'Corrent number of links returned');
is(scalar @{$first_feature_group_data->{'note'}},      2,                     'Corrent number of notes returned');
is($first_feature_group_data->{'link'}->[1]->{'href'}, 'groupurl2',           'Correct link href');
is($first_feature_group_data->{'link'}->[1]->{'txt'},  ' group link text 2',  'Correct link text');
is($first_feature_group_data->{'note'}->[1],           ' group note 2 text ', 'Correct note text');

1;
