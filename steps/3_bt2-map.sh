#!/usr/bin/env bash

bowtie2 -x /mnt/output/index_b73 -q /mnt/output/clean.fa --sensitive --threads 6 -S /mnt/output/aligned.sam
