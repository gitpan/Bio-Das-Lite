#########
# Author:        rmp@sanger.ac.uk
# Maintainer:    rmp@sanger.ac.uk
# Created:       2005-08-23
# Last Modified: $Date: 2007/02/23 00:14:40 $ $Author: rmp $
# Source:        $Source $
# Id:            $Id $
# $HeadURL $
#
# Note: This namespace is now deprecated. Please use Bio::Das::Lite instead.
#
package Bio::DasLite;
use strict;
use warnings;
use base qw(Bio::Das::Lite);

our $VERSION = do { my @r = (q$Revision: 1.44 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };
our $DEBUG   = 0;

1;

