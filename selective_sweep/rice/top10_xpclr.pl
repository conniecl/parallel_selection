#!usr/bin/perl -w
%pos=();@list=();
foreach $i(1..12)
{
    open IN,"<chr$i.$ARGV[0].10k.xpclr.txt" or die "$!";
    while(<IN>)
    {
        chomp;
        @tmp=split/\s+/,$_;
        if($tmp[3] > 0 && $tmp[3]=~/^\d/)
        {
            push @list,$tmp[3];
            $pos{$tmp[0]}{$tmp[1]}=$tmp[3];
        }
    }
    close IN;
}
@list=sort{$b<=>$a} @list;
$len=scalar(@list);
$index=int($len*0.1)-1;
print "$list[$index]\n";
open OUT,">$ARGV[0].top10.xpclr" or die "cannot open the file $!";
foreach $key1(sort{$a<=>$b} keys %pos)
{
    foreach $key2(sort{$a<=>$b} keys %{$pos{$key1}})
    {
        if($pos{$key1}{$key2}>=$list[$index])
        {
            $end=$key2+9999;
            print OUT "$key1\t$key2\t$end\t$pos{$key1}{$key2}\n";
        }
    }
}
close OUT;
