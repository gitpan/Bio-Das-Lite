#########
# Author:        rmp
# Last Modified: $Date: 2007/02/20 14:31:54 $ $Author: rmp $
# Id:            $Id: 00-distribution.t,v 1.40 2007/02/20 14:31:54 rmp Exp $
# Source:        $Source: /cvsroot/Bio-DasLite/Bio-DasLite/t/00-distribution.t,v $
# $HeadURL$
#
package distribution;
use strict;
use warnings;
use Test::Distribution;

our $VERSION = do { my @r = (q$Revision: 1.40 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

Test::Distribution->import();

1;
