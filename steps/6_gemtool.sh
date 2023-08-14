#!/usr/bin/env bash

tar -xzvf /mnt/genomes/Maize_AGPv4_B73_chroms.tar.gz
java -jar /mnt/gem/gem.jar \
  --d /mnt/gem/Read_Distribution_default.txt \
  --g /mnt/genomes/chrom.sizes \
  --genome Maize_AGPv4_B73_chroms \
  --exptCond1 /mnt/output/unique.bam \
  --ctrlCond1 /mnt/output/unique.bam \
  --f BAM --k_min 6 --k_max 13 --k_seqs 5000 \
  --smooth 5 --mrc 20 --poisson_control \
  --outBED --outMEME --outNP \
  --out /mnt/output/peaks.out
