#########
# Author:        rmp
# Last Modified: $Date: 2007/02/23 00:14:57 $ $Author: rmp $
# Id:            $Id: Makefile.PL,v 1.42 2007/02/23 00:14:57 rmp Exp $
# Source:        $Source: /cvsroot/Bio-DasLite/Bio-DasLite/Makefile.PL,v $
# $HeadURL$
#
package Makefile;
#use strict;
use warnings;
use 5.005;
use ExtUtils::MakeMaker;
use English qw(-no_match_vars);

our $VERSION = do { my @r = (q$Revision: 1.42 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

WriteMakefile(
	      'NAME'          => 'Bio::Das::Lite',
	      'AUTHOR'        => q(Roger M Pettett <rmp@sanger.ac.uk>),
	      'ABSTRACT_FROM' => 'lib/Bio/Das/Lite.pm',
	      'VERSION_FROM'  => 'lib/Bio/Das/Lite.pm',
	      'DISTNAME'      => 'Bio-Das-Lite',
	      'PREREQ_PM'     => {
				  'LWP::Parallel::UserAgent' => 0,
				  'HTTP::Request'            => 1.4,
				  'HTTP::Headers'            => 1.64,
				  'SOAP::Lite'               => 0.69,
				  'English'                  => 1.02,
				  'Carp'                     => 1.04,
				 },
	      'dist'          => { COMPRESS => 'gzip', SUFFIX => 'gz', },
	      'NO_META'       => 1,
	     );

print q(
******************************************************************************
** Some of the tests for this module need internet access                   **
** Also remember to set your http_proxy environment variable if you need to **
******************************************************************************
);

1;
