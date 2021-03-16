#!usr/bin/perl -w
open IN,"<$ARGV[0]" or die "$!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    $sum+=($tmp[2]-$tmp[1]+1);
}
close IN;
print "$sum\n";
