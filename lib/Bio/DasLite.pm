#########
# Note: This namespace is now deprecated. Please use Bio::Das::Lite instead.
#
package Bio::DasLite;
use strict;
use warnings;
use base qw(Bio::Das::Lite);

our $VERSION  = do { my @r = (q$Revision: 1.43 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };
*Bio::DasLite::DEBUG = *Bio::Das::Lite::DEBUG;

1;

