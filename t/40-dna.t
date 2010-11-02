#########
# Author:        rmp
# Last Modified: $Date: 2010-03-24 19:29:46 +0000 (Wed, 24 Mar 2010) $ $Author: zerojinx $
# Id:            $Id: 40-dna.t 19 2010-03-24 19:29:46Z zerojinx $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/40-dna.t,v $
# $HeadURL: https://bio-das-lite.svn.sourceforge.net/svnroot/bio-das-lite/tags/spec-1.53/t/40-dna.t $
#
package dna;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 19 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/dna.xml',
				});

my $result   = $das->dna();
my $expected = {
		'foo/dna'  => [
			       {
				'sequence_stop' => '2436345',
				'sequence_start' => '2435345',
				'dna' => 'atttcttggcgtaaataagagtctcaatgagactctcagaagaaaattgataaatattattaatgatataataataatcttgttgatccgttctatctccagacgattttcctagtctccagtcgattttgcgctgaaaatgggatatttaatggaattgtttttgtttttattaataaataggaataaatttacgaaaatcacaaaattttcaataaaaaacaccaaaaaaaagagaaaaaatgagaaaaatcgacgaaaatcggtataaaatcaaataaaaatagaaggaaaatattcagctcgtaaacccacacgtgcggcacggtttcgtgggcggggcgtctctgccgggaaaattttgcgtttaaaaactcacatataggcatccaatggattttcggattttaaaaattaatataaaatcagggaaatttttttaaattttttcacatcgatattcggtatcaggggcaaaattagagtcagaaacatatatttccccacaaactctactccccctttaaacaaagcaaagagcgatactcattgcctgtagcctctatattatgccttatgggaatgcatttgattgtttccgcatattgtttacaaccatttatacaacatgtgacgtagacgcactgggcggttgtaaaacctgacagaaagaattggtcccgtcatctactttctgattttttggaaaatatgtacaatgtcgtccagtattctattccttctcggcgatttggccaagttattcaaacacgtataaataaaaatcaataaagctaggaaaatattttcagccatcacaaagtttcgtcagccttgttatgtcaaccactttttatacaaattatataaccagaaatactattaaataagtatttgtatgaaacaatgaacactattataacattttcagaaaatgtagtatttaagcgaaggtagtgcacatcaaggccgtcaaacggaaaaatttttgcaagaatca',
				'sequence_version' => '2.45',
				'sequence_id' => 'XYZ123',
				'dna_length' => '1000'
			       }
			      ]
	       };

is_deeply($result, $expected, 'is_deeply');

1;
