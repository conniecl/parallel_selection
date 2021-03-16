/public/home/lchen/software/vcftools-0.1.16/bin/vcftools --gzvcf /public/home/lchen/zeamap/01.data/final_vcf/merge_${chr}_filter.vcf.gz --keep ./par --out ./merge_$chr.par --recode --recode-INFO-all ## $chr=1,2,3...10
perl plink2haploview.pl $chr.par
perl map2info.pl $chr.par
perl 500k_haploview.pl $chr par
java -jar -Xmx50g /public/home/lchen/software/haplowiew/Haploview.jar -memory 51200 -n -pedfile $chr.par_haploview.ped -info $chr.par_haploview.info -log $chr.par.log -minMAF 0.05 -hwcutoff 0 -missingCutoff 0.5 -dprime -out ./$chr.par
perl gain_lsf.pl par
/public/home/lchen/software/XPCLR/bin/XPCLR -xpclr chr$i.amp.geno chr$i.par.geno1 chr$i.snp chr$i.1k -w1 0.005 100 1000 $i -p0 0.7 ##$i=1,2,3,4..10
