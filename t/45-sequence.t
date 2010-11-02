#########
# Author:        rmp
# Last Modified: $Date: 2010-11-02 09:54:35 +0000 (Tue, 02 Nov 2010) $ $Author: andyjenkinson $
# Id:            $Id: 45-sequence.t 47 2010-11-02 09:54:35Z andyjenkinson $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/45-sequence.t,v $
# $HeadURL: https://bio-das-lite.svn.sourceforge.net/svnroot/bio-das-lite/trunk/t/45-sequence.t $
#
package sequence;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 47 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/sequence.xml',
				});

my $result   = $das->sequence();
my $expected = {
		'foo/sequence'  => [
				    {
				     'sequence_stop' => '2436345',
				     'sequence_start' => '2435345',
				     'sequence' => 'atttcttggcgtaaataagagtctcaatgagactctcagaagaaaattgataaatattattaatgatataataataatcttgttgatccgttctatctccagacgattttcctagtctccagtcgattttgcgctgaaaatgggatatttaatggaattgtttttgtttttattaataaataggaataaatttacgaaaatcacaaaattttcaataaaaaacaccaaaaaaaagagaaaaaatgagaaaaatcgacgaaaatcggtataaaatcaaataaaaatagaaggaaaatattcagctcgtaaacccacacgtgcggcacggtttcgtgggcggggcgtctctgccgggaaaattttgcgtttaaaaactcacatataggcatccaatggattttcggattttaaaaattaatataaaatcagggaaatttttttaaattttttcacatcgatattcggtatcaggggcaaaattagagtcagaaacatatatttccccacaaactctactccccctttaaacaaagcaaagagcgatactcattgcctgtagcctctatattatgccttatgggaatgcatttgattgtttccgcatattgtttacaaccatttatacaacatgtgacgtagacgcactgggcggttgtaaaacctgacagaaagaattggtcccgtcatctactttctgattttttggaaaatatgtacaatgtcgtccagtattctattccttctcggcgatttggccaagttattcaaacacgtataaataaaaatcaataaagctaggaaaatattttcagccatcacaaagtttcgtcagccttgttatgtcaaccactttttatacaaattatataaccagaaatactattaaataagtatttgtatgaaacaatgaacactattataacattttcagaaaatgtagtatttaagcgaaggtagtgcacatcaaggccgtcaaacggaaaaatttttgcaagaatca',
				     'sequence_version' => '2.45',
				     'sequence_id' => 'id'
				    }
				   ]
	       };

is_deeply($result, $expected, 'is_deeply');

1;
