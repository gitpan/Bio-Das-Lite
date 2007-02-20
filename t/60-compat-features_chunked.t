#########
# Author:        rmp
# Last Modified: $Date: 2007/02/20 14:31:54 $ $Author: rmp $
# Id:            $Id: 60-compat-features_chunked.t,v 1.2 2007/02/20 14:31:54 rmp Exp $
# Source:        $Source: /cvsroot/Bio-DasLite/Bio-DasLite/t/60-compat-features_chunked.t,v $
# $HeadURL$
#
package compat_features_chunked;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStubChunkedCompat;

our $VERSION = do { my @r = (q$Revision: 1.2 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStubChunkedCompat->new({
					      'dsn'      => 'http://foo/das/bar',
					      'filedata' => 't/features.xml',
					     });
my $features = $das->features();
my $results  = (values %{$features})[0];

is(scalar @{$results}, 102, 'Chunked-response-mode gave number of features returned');

1;
