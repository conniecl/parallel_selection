#!usr/bin/perl -w
%pos=();@list=();
open IN,"<$ARGV[0]_maize.pi.combine.mask" or die "cannot open the file $!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[3] ne "NA")
    {
        $pos{$tmp[0]}{$tmp[1]}=$tmp[3];
        push @list,$tmp[3];
    }
}
close IN;
@list=sort{$b<=>$a} @list;
$len=scalar(@list);
$index=int($len*0.1)-1;
print "$list[$index]\n";
open OUT,">$ARGV[0].2k.top10.pi" or die "cannot open the file $!";
foreach $key1(sort{$a<=>$b} keys %pos)
{
    foreach $key2(sort{$a<=>$b} keys %{$pos{$key1}})
    {
        if($pos{$key1}{$key2}>=$list[$index])
        {
            $end=$key2+1999;
            print OUT "$key1\t$key2\t$end\n";#$pos{$key1}{$key2}\n";
        }
    }
}
close OUT;
