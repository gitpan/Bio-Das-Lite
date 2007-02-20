#########
# Author:        rmp
# Last Modified: $Date: 2007/02/20 14:31:54 $ $Author: rmp $
# Id:            $Id: 50-compat-entry_points.t,v 1.2 2007/02/20 14:31:54 rmp Exp $
# Source:        $Source: /cvsroot/Bio-DasLite/Bio-DasLite/t/50-compat-entry_points.t,v $
# $HeadURL$
#
package compat_entry_points;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStubCompat;

our $VERSION = do { my @r = (q$Revision: 1.2 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStubCompat->new({
				       'dsn'      => 'foo',
				       'filedata' => 't/entry_points.xml',
				      });
my $ep       = $das->entry_points();
my $results  = (values %{$ep})[0];

is(scalar @{$results->[0]->{'segment'}}, 22, 'Correct number of segments returned');

1;
