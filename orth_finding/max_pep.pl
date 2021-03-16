#!usr/bin/perl -w
open IN,"gzip -d -c IRGSP-1.0_protein_2019-06-26.fasta.gz|" or die "$!";
%gene=();%hash=();
while(<IN>)
{
    if($_=~/^>/)
    {
        s/>//g;
        $name=(split/\s+/,$_)[0];
        $id=(split("-",$name))[0];
        push @{$gene{$id}},$name;
    }
    else
    {
        $hash{$name}.=$_;
    }
}
close IN;
open OUT,">IRGSP.max.pep.fa" or die "$!";
foreach $key1(keys %gene)
{
    $max=0;$max_seq="";$max_name="";
    foreach $key2(@{$gene{$key1}})
    {
        $len=length($hash{$key2});
        if($len>$max)
        {
            $max_seq=$hash{$key2};
            $max_name=$key2;
            $max=$len;
        }
    }
    print OUT ">","$max_name\n$max_seq";
}
close OUT;
