## change chr1 to chr2,3,4...12
## change indica to japonica, sativa
perl snp_genetic.pl 1
perl geno.pl 1
/public/home/lchen/software/XPCLR/bin/XPCLR -xpclr chr1.indica.geno chr1.wide.geno chr1.snp chr1.indica.10k -w1 0.0002 400 10000 1 -p0 0.7
perl top10_xpclr.pl
