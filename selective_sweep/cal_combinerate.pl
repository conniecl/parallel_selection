#!usr/bin/perl -w
open IN,"<TEO_B73_linkagemap.v4.noctg" or die "$!";
$chr=0;
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[0] ne $chr)
    {
        open $fh{$tmp[0]},">$tmp[0].genetic.map" or die "$!";
        $fh{$tmp[0]}->print("position COMBINED_rate(cM/Mb) Genetic_Map(cM)\n");
        $next=<IN>;
        chomp($next);
        @brray=split("\t",$next);
        $rate=1000000*($brray[3]-$tmp[3])/($brray[2]-$tmp[2]);
        $fh{$tmp[0]}->print("$tmp[1] $rate $tmp[3]\n");
        $fh{$tmp[0]}->print("$brray[1] $rate $brray[3]\n");
    }
    else
    {
        $rate=1000000*($tmp[3]-$brray[3])/($tmp[2]-$brray[2]);
        $fh{$tmp[0]}->print("$tmp[1] $rate $tmp[3]\n");
    }
    @brray=split("\t",$_);
    $chr=$tmp[0];
}
close IN;
