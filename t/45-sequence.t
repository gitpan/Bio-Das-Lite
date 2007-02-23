#########
# Author:        rmp
# Last Modified: $Date: 2007/02/23 00:18:19 $ $Author: rmp $
# Id:            $Id: 45-sequence.t,v 1.1 2007/02/23 00:18:19 rmp Exp $
# Source:        $Source: /cvsroot/Bio-DasLite/Bio-DasLite/t/45-sequence.t,v $
# $HeadURL$
#
package sequence;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 1.1 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/sequence.xml',
				});

my $result   = $das->sequence();
my $expected = {
		'foo/sequence?' => [
				    {
				     'sequence_stop' => '2436345',
				     'sequence_start' => '2435345',
				     'sequence' => 'atttcttggcgtaaataagagtctcaatgagactctcagaagaaaattgataaatattattaatgatataataataatcttgttgatccgttctatctccagacgattttcctagtctccagtcgattttgcgctgaaaatgggatatttaatggaattgtttttgtttttattaataaataggaataaatttacgaaaatcacaaaattttcaataaaaaacaccaaaaaaaagagaaaaaatgagaaaaatcgacgaaaatcggtataaaatcaaataaaaatagaaggaaaatattcagctcgtaaacccacacgtgcggcacggtttcgtgggcggggcgtctctgccgggaaaattttgcgtttaaaaactcacatataggcatccaatggattttcggattttaaaaattaatataaaatcagggaaatttttttaaattttttcacatcgatattcggtatcaggggcaaaattagagtcagaaacatatatttccccacaaactctactccccctttaaacaaagcaaagagcgatactcattgcctgtagcctctatattatgccttatgggaatgcatttgattgtttccgcatattgtttacaaccatttatacaacatgtgacgtagacgcactgggcggttgtaaaacctgacagaaagaattggtcccgtcatctactttctgattttttggaaaatatgtacaatgtcgtccagtattctattccttctcggcgatttggccaagttattcaaacacgtataaataaaaatcaataaagctaggaaaatattttcagccatcacaaagtttcgtcagccttgttatgtcaaccactttttatacaaattatataaccagaaatactattaaataagtatttgtatgaaacaatgaacactattataacattttcagaaaatgtagtatttaagcgaaggtagtgcacatcaaggccgtcaaacggaaaaatttttgcaagaatca',
				     'sequence_version' => '2.45',
				     'sequence_moltype' => 'DNA',
				     'sequence_id' => 'id'
				    }
				   ]
	       };

is_deeply($result, $expected, 'is_deeply');

1;
