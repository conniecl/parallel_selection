#!usr/bin/perl -w
foreach $i(1..10)
{
    open IN1,"<chr$i.$ARGV[0].2k.windowed.pi" or die "cannot open the file $!";
    open IN2,"<chr$i.maize.2k.windowed.pi" or die "cannot open the file $!";
    readline IN1;
    readline IN2;
    while(<IN1>)
    {
        chomp;
        @tmp=split("\t",$_);
	if($tmp[3]>=5)
	{
            $hash{$tmp[0]}{$tmp[1]}=$tmp[-1];
	}
    }
    close IN1;
    open OUT,">chr$i.$ARGV[0]_divide_maize.2k.pi" or die "cannot open the file $!";
    while(<IN2>)
    {
        chomp;
        @tmp=split("\t",$_);
        $end=$tmp[1]+1999;
        if(exists $hash{$tmp[0]}{$tmp[1]} && $tmp[3]>=5)
        {
            $v=$hash{$tmp[0]}{$tmp[1]}/$tmp[-1];
            print OUT "$tmp[0]\t$tmp[1]\t$end\t$v\n";
        }
        else
        {
            print OUT "$tmp[0]\t$tmp[1]\t$end\tNA\n";
        }
    }
    close IN2;
    close OUT;
}
