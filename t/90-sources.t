#########
# Author:        rdf
# Last Modified: $Date: 2010-03-24 19:29:46 +0000 (Wed, 24 Mar 2010) $ $Author: zerojinx $
# Id:            $Id: 90-sources.t 19 2010-03-24 19:29:46Z zerojinx $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/90-sources.t,v $
# $HeadURL: https://bio-das-lite.svn.sourceforge.net/svnroot/bio-das-lite/tags/spec-1.53/t/90-sources.t $
#
package sources;
use strict;
use warnings;
use Test::More tests => 2;
use English qw(-no_match_vars);
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 19 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/source.xml',
				});
my $features = $das->sources();
my $results  = (values %{$features})[0];

is(scalar @{$results}, 1, q(Whole-response-mode gave correct number of sources returned));
is($results->[0]->{source}->[0]->{maintainer}->[0]->{maintainer_email}, 'dasmaster@example.com', q(Got maintainers email));


1;
