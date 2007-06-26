#########
# Author:        rpettett@cpan.org
# Maintainer:    rpettett@cpan.org
# Created:       2005-08-23
# Last Modified: $Date: 2007/06/26 09:06:12 $ $Author: rmp $
# Source:        $Source $
# Id:            $Id $
# $HeadURL $
#
package Bio::Das::Lite::UserAgent;
use strict;
use warnings;
use base qw(LWP::Parallel::UserAgent);
use Bio::Das::Lite::UserAgent::proxy;

our $VERSION  = do { my @r = (q$Revision: 1.3 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

sub new {
  my ($class, %args) = @_;
  my $self = LWP::Parallel::UserAgent->new(%args);
  bless $self, $class;
  $self->{'http_proxy'} = $args{'http_proxy'}; # || $ENV{'http_proxy'};
  return $self;
}

sub _need_proxy {
  my $self = shift;
  $self->{'http_proxy'} or return;
  my ($scheme, $host, $port) = $self->{'http_proxy'} =~ m|(https?)://([^:\#\?/]+):?(\d+)?|mx;
  $host or return;
  my $proxy = {
	       'host'   => $host,
	       'port'   => $port   || '3128',
	       'scheme' => $scheme || 'http',
	      };
  bless $proxy, 'Bio::Das::Lite::UserAgent::proxy';
  return $proxy;
}

sub on_failure {
  my ($self, $request, $response, $entry)   = @_;
  $self->{'statuscodes'}                  ||= {};
  $self->{'statuscodes'}->{$request->url()} = $response->status_line();
  return;
}

sub on_return {
  return on_failure(@_);
}

sub statuscodes {
  my ($self, $url)         = @_;
  $self->{'statuscodes'} ||= {};
  return $url?$self->{'statuscodes'}->{$url}:$self->{'statuscodes'};
}

1;

__END__

=head1 NAME

Bio::Das::Lite::UserAgent - A derivative of LWP::Parallel::UserAgent for Bio::Das::Lite use

=head1 VERSION

$Revision: 1.3 $

=head1 SYNOPSIS

=head1 DESCRIPTION

A subclass of LWP::Parallel::UserAgent supporting forward proxies

=head1 SUBROUTINES/METHODS

=head2 new : Constructor

Call with whatever LWP::P::UA usually has

=head2 on_failure : internal error propagation method

=head2 on_return : internal error propagation method

=head2 statuscodes : helper for tracking response statuses keyed on url

=head1 DIAGNOSTICS

=head1 CONFIGURATION AND ENVIRONMENT

=head1 DEPENDENCIES

LWP::Parallel::UserAgent

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

=head1 AUTHOR

Roger Pettett, E<lt>rpettett@cpan.orgE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2007 GRL, by Roger Pettett

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.4 or,
at your option, any later version of Perl 5 you may have available.

=cut
