#!/usr/bin/env bash

gunzip -c /mnt/genomes/Maize_AGPv4_B73.fa.gz > /mnt/output/genome_b73.fa
bowtie2-build /mnt/output/genome_b73.fa --threads 6 /mnt/output/index_b73

