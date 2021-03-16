#!usr/bin/perl -w
foreach $i(1..10)
{
open OUT,">$i.$ARGV[0].lsf" or die "$!";
print OUT "#BSUB -J $i.$ARGV[0]\n";
print OUT "#BSUB -n 1\n";
print OUT "#BSUB -R span[hosts=1]\n";
print OUT "#BSUB -M 20GB\n";
print OUT "#BSUB -R rusage[mem=20GB]\n";
print OUT "#BSUB -o $i.$ARGV[0].out\n";
print OUT "#BSUB -e $i.$ARGV[0].err\n";
print OUT "#BSUB -q high\n";
print OUT "#perl nold_list.pl $ARGV[0] $i\n";
print OUT "#perl nold_pos.pl $ARGV[0] $i\n";
print OUT "perl snp_genetic.pl $ARGV[0] $i\n";
print OUT "perl geno.pl $ARGV[0] $i\n";
close OUT;
}
