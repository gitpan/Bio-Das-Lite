use 5.005;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Bio::Das::Lite',
    VERSION_FROM      => 'lib/Bio/Das/Lite.pm', # finds $VERSION
    PREREQ_PM         => {LWP::Parallel::UserAgent => undef,
			  HTTP::Request => undef,
			  HTTP::Headers => undef,
			  SOAP::Lite    => undef,
			  English       => undef,
			  Carp          => undef,
			 }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Bio/Das/Lite.pm', # retrieve abstract from module
       AUTHOR         => 'Roger M Pettett <rmp@sanger.ac.uk>') : ()),
);
print qq(
******************************************************************************
** The tests for this module need internet access                           **
** Also remember to set your http_proxy environment variable if you need to **
******************************************************************************
);

