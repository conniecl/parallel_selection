#!usr/bin/perl -w
use List::Util qw/max min sum/;
open IN,"<teo_overlap.$ARGV[0].merge.bed" or die "$!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    $len=$tmp[2]-$tmp[1]+1;
    push @list,$len;
}
close IN;
$sum=sum(@list);
$max=max(@list);
$min=min(@list);
print "$sum\t$min\t$max\n";
