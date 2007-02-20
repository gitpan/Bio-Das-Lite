#########
# Author:        rmp
# Last Modified: $Date: 2007/02/20 14:31:54 $ $Author: rmp $
# Id:            $Id: 07-compat-singledsn-multiseg.t,v 1.2 2007/02/20 14:31:54 rmp Exp $
# Source:        $Source: /cvsroot/Bio-DasLite/Bio-DasLite/t/07-compat-singledsn-multiseg.t,v $
# $HeadURL$
#
package compat_singledsn_multiseg;
use strict;
use warnings;
use Test::More tests => 10;
use Bio::DasLite;

our $VERSION = do { my @r = (q$Revision: 1.2 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $src  = [qw(http://servlet.sanger.ac.uk/das/ensembl1834)];
my $das  = Bio::DasLite->new({
			      'dsn'     => $src,
			      'timeout' => 30,
			     });

my $req = ['1:1,1000', '15:1,1000'];
for my $call (qw(features sequence)) {
  my $res       = $das->$call($req);
  is(ref($res), 'HASH',                      "$call returns a hash");
  is(scalar keys %{$res}, (@{$src}*@{$req}), "$call returns data to the tune of (number of sources * number of segments)");
  is(ref((values %{$res})[0]), 'ARRAY',      "$call hash contains an array");

  my $codes = $das->statuscodes();
  for my $k (keys %{$res}) {
    my $code = (substr $codes->{$k}, 0, 3)||q();

    if($code == 500) {
      diag("$call call failed due to server error");
      pass('not failing on server error');

    } elsif($code == 200) {

      ok(scalar @{$res->{$k}} > 0,      "$call returns some data");

    } else {
      fail("Unexpected response code: $code");
    }
  }
}

1;
