#!usr/bin/perl -w
open IN,"<par_overlap.merge.bed" or die "$!";
$chr=0;
open OUT,">par_overlap.$ARGV[0]0k.merge.bed" or die "$!";
$thred=$ARGV[0]*10000;
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[0] ne $chr)
    {
        if($end)
        {
            print OUT "$end\n";
        }
        $chr=$tmp[0];
        print OUT "$tmp[0]\t$tmp[1]\t";
        $end=$tmp[2];
    }
    else
    {
        $len=$tmp[1]-$end;
        if($len>$thred)
        {
            print OUT "$end\n$tmp[0]\t$tmp[1]\t";
        }
        $end=$tmp[2];
    }
}
print OUT "$end\n";
close IN;
close OUT;
