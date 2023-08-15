#!/usr/bin/env bash

# extract and index B73 genome
gunzip -c /mnt/genomes/Maize_AGPv4_B73.fa.gz > /mnt/output/genome_B73.fa
bowtie2-build /mnt/output/genome_B73.fa --threads 6 /mnt/output/index_B73

# extract and index A632 genome
gunzip -c /mnt/genomes/Maize_A632_Wang_2023.fa.gz > /mnt/output/genome_A632.fa
bowtie2-build /mnt/output/genome_A632.fa --threads 6 /mnt/output/index_A632

